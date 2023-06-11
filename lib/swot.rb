require "public_suffix"
require "naughty_or_nice"
require_relative "swot/academic_tlds"
require_relative "swot/collection_methods"

class Swot

  VERSION = "1.0.2"

  # These are domains that snuck into the edu registry,
  # but don't pass the education sniff test
  # Note: validated domain must not end with the blacklisted string
  BLACKLIST = File.readlines(File.join(__dir__, '../data/lib/domains/stoplist.txt')).map(&:chomp).freeze

  include NaughtyOrNice
  extend SwotCollectionMethods
  class << self
    alias_method :is_academic?, :valid?
    alias_method :academic?, :valid?

    def get_institution_name(text)
      Swot.new(text).institution_name
    end
    alias_method :school_name, :get_institution_name

    def domains_path
      @domains_path ||= File.expand_path "../data/lib/domains", File.dirname(__FILE__)
    end

    # Returns a new Swot instance for the domain file at the given path.
    #   Note that the path must be absolute.
    #
    # Returns a Swot instance or false is no domain is found at the given path.
    def from_path(path_string_or_path)
      path = Pathname.new(path_string_or_path)
      return false unless path.exist?
      path_dir, file = path.relative_path_from(Pathname.new(domains_path)).split
      backwards_path = path_dir.to_s.split('/').push(file.basename('.txt').to_s)
      domain = backwards_path.reverse.join('.')
      Swot.new(domain)
    end
  end

  # Figure out if an email or domain belongs to academic institution.
  #
  # Returns true if the domain name belongs to an academic institution;
  #  false otherwise.
  def valid?
    if domain.nil?
      false
    elsif BLACKLIST.any? { |d| to_s =~ /(\A|\.)#{Regexp.escape(d)}\z/ }
      false
    elsif ACADEMIC_TLDS.include?(domain.tld)
      true
    elsif academic_domain?
      true
    else
      false
    end
  end

  # Figure out the institution name based on the email address/domain.
  #
  # Returns a string with the institution name; nil if nothing is found.
  def institution_name
    @institution_name ||= File.read(file_path, :mode => "rb", :external_encoding => "UTF-8").strip
  rescue
    nil
  end
  alias_method :school_name, :institution_name
  alias_method :name, :institution_name

  # Figure out if a domain name is a know academic institution.
  #
  # Returns true if the domain name belongs to a known academic institution;
  #  false otherwise.
  def academic_domain?
    @academic_domain ||= File.exist?(file_path) || File.exist?(file_extended_path)
  end

  private

  def file_path
    @file_path ||= File.join(Swot::domains_path, domain.domain.to_s.split(".").reverse) + ".txt"
  end

  def file_extended_path
    @file_extended_path ||= File.join([Swot::domains_path, domain.to_s.split(".").reverse].flatten) + ".txt"
  end
end
