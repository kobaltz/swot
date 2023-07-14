# encoding: UTF-8
require 'helper'

describe Swot do
  it "recognizes academic email addresses and domains" do
    assert Swot::is_academic?('lreilly@stanford.edu')
    assert Swot::is_academic?('LREILLY@STANFORD.EDU')
    assert Swot::is_academic?('Lreilly@Stanford.Edu')
    assert Swot::is_academic?('lreilly@slac.stanford.edu')
    assert Swot::is_academic?('lreilly@strath.ac.uk')
    assert Swot::is_academic?('lreilly@soft-eng.strath.ac.uk')
    assert Swot::is_academic?('lee@ugr.es')
    assert Swot::is_academic?('lee@uottawa.ca')
    assert Swot::is_academic?('lee@mother.edu.ru')
    assert Swot::is_academic?('lee@ucy.ac.cy')
    assert Swot::is_academic?('dave.kimura@osu.edu')
    assert Swot::is_academic?('kimura.13@osu.edu')
    assert Swot::is_academic?('dave@daffodil.ac')
    assert Swot::is_academic?('dave@cti.za.ac')
    assert Swot::is_academic?('dave@lsst.ac')
    assert Swot::is_academic?('dave@dcc.netpoint.com.bd')
    assert Swot::is_academic?('dave@student.gatewayhs.com')
    assert Swot::is_academic?('dave@politecnics.barcelona')
    assert Swot::is_academic?('me@nimsuniversity.org')


    assert_not Swot::is_academic?('support@driftingruby.com')
    assert_not Swot::is_academic?('lee@leerilly.net')
    assert_not Swot::is_academic?('lee@gmail.com')
    assert_not Swot::is_academic?('lee@stanford.edu.com')
    assert_not Swot::is_academic?('lee@strath.ac.uk.com')

    assert Swot::is_academic?('stanford.edu')
    assert Swot::is_academic?('slac.stanford.edu')
    assert Swot::is_academic?('www.stanford.edu')
    assert Swot::is_academic?('http://www.stanford.edu')
    assert Swot::is_academic?('http://www.stanford.edu:9393')
    assert Swot::is_academic?('strath.ac.uk')
    assert Swot::is_academic?('soft-eng.strath.ac.uk')
    assert Swot::is_academic?('ugr.es')
    assert Swot::is_academic?('uottawa.ca')
    assert Swot::is_academic?('mother.edu.ru')
    assert Swot::is_academic?('ucy.ac.cy')

    assert_not Swot::is_academic?('leerilly.net')
    assert_not Swot::is_academic?('gmail.com')
    assert_not Swot::is_academic?('stanford.edu.com')
    assert_not Swot::is_academic?('strath.ac.uk.com')

    assert_not Swot::is_academic?(nil)
    assert_not Swot::is_academic?('')
    assert_not Swot::is_academic?('the')

    assert Swot::is_academic?(' stanford.edu')
    assert Swot::is_academic?('lee@strath.ac.uk ')
    assert_not Swot::is_academic?(' gmail.com ')

    assert Swot::is_academic?('lee@stud.uni-corvinus.hu')

    # overkill
    assert Swot::is_academic?('lee@harvard.edu')
    assert Swot::is_academic?('lee@mail.harvard.edu')
  end

  it "returns name of valid institution" do
    assert_match "University of Strathclyde",        Swot::get_institution_name('lreilly@cs.strath.ac.uk')
    assert_match "BRG Fadingerstraße Linz, Austria", Swot::get_institution_name('lreilly@fadi.at')
  end

  it "returns nil when institution invalid" do
    assert_not Swot::get_institution_name('foo@shop.com')
  end

  it "test aliased methods" do
    assert Swot::academic?('stanford.edu')
    assert_match "University of Strathclyde", Swot::school_name('lreilly@cs.strath.ac.uk')
  end

  it "fail blacklisted domains" do
    ["si.edu", " si.edu ", "imposter@si.edu", "foo.si.edu", "america.edu"].each do |domain|
      assert_not Swot::is_academic?(domain), "#{domain} should be denied"
    end
    ["student.tsu.edu.ph"].each do |domain|
      assert_not Swot::is_academic?(domain), "#{domain} should be denied"
    end
  end

  it "not err on tld-only domains" do
    Swot::is_academic? ".com"
    assert_not Swot::is_academic?(".com")
  end

  it "does not err on invalid domains" do
    assert_not Swot::is_academic?("foo@bar.invalid")
  end

  # it "contains only text files" do
  #   Dir.glob("lib/domains/**/*") do |file|
  #     if not File.directory?(file)
  #       assert file.end_with?(".txt"), "#{file} should have a .txt extension"
  #     end
  #   end
  # end

  # it "contains no file with an invalid encoding" do
  #   Dir.glob("lib/domains/**/*") do |file|
  #     if not File.directory?(file)
  #       File.open(file, "r") do |fh|
  #         assert fh.read.valid_encoding?, "Invalid encoding for #{file}"
  #       end
  #     end
  #   end
  # end

  # it "contains only file with a single line" do
  #   Dir.glob("lib/domains/**/*") do |file|
  #     if not File.directory?(file)
  #       File.open(file, "r") do |fh|
  #         assert fh.read.lines.count == 1, "#{file} should only contain one line"
  #       end
  #     end
  #   end
  # end
end
