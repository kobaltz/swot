# encoding: UTF-8
require 'helper'

describe Swot do
  describe "academic email recognition" do
    it "recognizes standard academic email addresses" do
      assert Swot.is_academic?('lreilly@stanford.edu')
      assert Swot.is_academic?('LREILLY@STANFORD.EDU')
      assert Swot.is_academic?('Lreilly@Stanford.Edu')
      assert Swot.is_academic?('lreilly@slac.stanford.edu')
      assert Swot.is_academic?('lreilly@strath.ac.uk')
      assert Swot.is_academic?('lreilly@soft-eng.strath.ac.uk')
      assert Swot.is_academic?('lee@ugr.es')
      assert Swot.is_academic?('lee@uottawa.ca')
      assert Swot.is_academic?('lee@mother.edu.ru')
      assert Swot.is_academic?('lee@ucy.ac.cy')
    end

    it "recognizes email addresses with special formats" do
      assert Swot.is_academic?('dave.kimura@osu.edu')
      assert Swot.is_academic?('kimura.13@osu.edu')
      assert Swot.is_academic?('lee@stud.uni-corvinus.hu')
      assert Swot.is_academic?('lee@harvard.edu')
      assert Swot.is_academic?('lee@mail.harvard.edu')
      assert Swot.is_academic?('lee@strath.ac.uk ')  # trailing space
    end

    it "handles international academic email addresses" do
      assert Swot.is_academic?('dave@daffodil.ac')
      assert Swot.is_academic?('dave@cti.za.ac')
      assert Swot.is_academic?('dave@lsst.ac')
      assert Swot.is_academic?('dave@dcc.netpoint.com.bd')
      assert Swot.is_academic?('dave@student.gatewayhs.com')
      assert Swot.is_academic?('dave@politecnics.barcelona')
      assert Swot.is_academic?('me@nimsuniversity.org')
    end

    it "rejects non-academic email addresses" do
      assert_not Swot.is_academic?('support@driftingruby.com')
      assert_not Swot.is_academic?('lee@leerilly.net')
      assert_not Swot.is_academic?('lee@gmail.com')
      assert_not Swot.is_academic?('lee@stanford.edu.com')
      assert_not Swot.is_academic?('lee@strath.ac.uk.com')
    end

    it "recognizes various education domains in email addresses" do
      assert Swot.is_academic?('dave@faculdadefia.edu.br')
      assert Swot.is_academic?('dave@uteco.edu.do')
      assert Swot.is_academic?('dave@uca.edu.ar')
      assert Swot.is_academic?('dave@my.barstow.edu')
      assert Swot.is_academic?('dave@student.ccp.edu')
      assert Swot.is_academic?('dave@students.prairiestate.edu')
    end

    it "rejects email addresses from hait.edu.cn" do
      assert_not Swot.is_academic?('dave@hait.edu.cn')
    end

    it "rejects email addresses from mail.chzu.edu.cn" do
      assert_not Swot.is_academic?('dave@mail.chzu.edu.cn')
    end

    it "accepts email addresses from stud.tjut.edu.cn" do
      assert Swot.is_academic?('dave@stud.tjut.edu.cn')
    end

    it "rejects email addresses from njit.edu.cn" do
      assert_not Swot.is_academic?('dave@njit.edu.cn')
    end

    it "rejects email addresses from hait.edu.cn" do
      assert_not Swot.is_academic?('dave@hait.edu.cn')
    end

    it "rejects email addresses from stumail.sdut.edu.cn" do
      assert_not Swot.is_academic?('dave@stumail.sdut.edu.cn')
    end
  end

  describe "academic domain recognition" do
    it "recognizes academic domains" do
      assert Swot.is_academic?('stanford.edu')
      assert Swot.is_academic?('slac.stanford.edu')
      assert Swot.is_academic?('www.stanford.edu')
      assert Swot.is_academic?('http://www.stanford.edu')
      assert Swot.is_academic?('http://www.stanford.edu:9393')
      assert Swot.is_academic?('strath.ac.uk')
      assert Swot.is_academic?('soft-eng.strath.ac.uk')
      assert Swot.is_academic?(' stanford.edu')  # leading space
    end

    it "recognizes international academic domains" do
      assert Swot.is_academic?('ugr.es')
      assert Swot.is_academic?('uottawa.ca')
      assert Swot.is_academic?('mother.edu.ru')
      assert Swot.is_academic?('ucy.ac.cy')
    end

    it "rejects non-academic domains" do
      assert_not Swot.is_academic?('leerilly.net')
      assert_not Swot.is_academic?('gmail.com')
      assert_not Swot.is_academic?('stanford.edu.com')
      assert_not Swot.is_academic?('strath.ac.uk.com')
      assert_not Swot.is_academic?(' gmail.com ')
    end

    it "recognizes US community college domains" do
      assert Swot.is_academic?('dave@sinclair.edu')
      assert Swot.is_academic?('dave@collin.edu')
      assert Swot.is_academic?('dave@buc.blinn.edu')
      assert Swot.is_academic?('dave@roxbury.edu')
      assert Swot.is_academic?('dave@stchas.edu')
      assert Swot.is_academic?('dave@email.tjc.edu')
      assert Swot.is_academic?('dave@dtcc.edu')
      assert Swot.is_academic?('dave@wwcc.edu')
      assert Swot.is_academic?('dave@my.stchas.edu')
      assert Swot.is_academic?('dave@student.egcc.edu')
      assert Swot.is_academic?('dave@holmescc.edu')
      assert Swot.is_academic?('dave@navarrocollege.edu')
    end

    it "recognizes various international academic institutions" do
      assert Swot.is_academic?('dave@ucsiuniversity.edu.my')
      assert Swot.is_academic?('dave@asu.edu')
      assert Swot.is_academic?('dave@student.ptss.edu.my')
      assert Swot.is_academic?('dave@buc.edu.eg')
      assert Swot.is_academic?('dave@campusucc.edu.co')
      assert Swot.is_academic?('dave@student.utem.edu.my')
      assert Swot.is_academic?('dave@pucgo.edu.br')
      assert Swot.is_academic?('dave@mahasiswa.itb.ac.id')
      assert Swot.is_academic?('dave@case.edu')
      assert Swot.is_academic?('dave@uncp.edu.pe')
      assert Swot.is_academic?('dave@dyptc.edu.in')
      assert Swot.is_academic?('dave@mubs.ac.ug')
      assert Swot.is_academic?('dave@aluno.unip.br')
      assert Swot.is_academic?('dave@aluno.unicarioca.edu.br')
      assert Swot.is_academic?('dave@indoamerica.edu.ec')
      assert Swot.is_academic?('dave@umbc.edu')
      assert Swot.is_academic?('dave@azhar.edu.eg')
      assert Swot.is_academic?('dave@cibertec.edu.pe')
      assert Swot.is_academic?('dave@ivytech.edu')
      assert Swot.is_academic?('dave@cwru.edu')
      assert Swot.is_academic?('dave@mec.edu.py')
      assert Swot.is_academic?('dave@mu.edu.sa')
      assert Swot.is_academic?('dave@moe-dl.edu.my')
      assert Swot.is_academic?('dave@lau.edu')
      assert Swot.is_academic?('dave@os-dkorac.edu.me')
      assert Swot.is_academic?('dave@continental.edu.pe')
      assert Swot.is_academic?('dave@utch.edu.co')
    end

    it "rejects certain domains" do
      assert_not Swot.is_academic?('dave@edu.azores.gov.pt')
      assert_not Swot.is_academic?('dave@jmpaneracollege.com')
      assert_not Swot.is_academic?('dave@workschool.ca')
      assert_not Swot.is_academic?('dave@itstep.academy')
      assert_not Swot.is_academic?('dave@ghanacu.org')
      assert_not Swot.is_academic?('dave@alumni.imperial.ac.uk')
      assert_not Swot.is_academic?('dave@hbtcm.edu.cn')
    end
  end

  describe "edge cases" do
    it "handles null and empty values correctly" do
      assert_not Swot.is_academic?(nil)
      assert_not Swot.is_academic?('')
      assert_not Swot.is_academic?('the')
    end

    it "handles alumni domains correctly" do
      assert_not Swot.is_academic?('alumni.albany.edu')
    end
  end

  it "returns name of valid institution" do
    assert_match "University of Strathclyde",        Swot.get_institution_name('lreilly@cs.strath.ac.uk')
    assert_match "BRG Fadingerstraße Linz, Austria", Swot.get_institution_name('lreilly@fadi.at')
  end

  it "returns nil when institution invalid" do
    assert_not Swot.get_institution_name('foo@shop.com')
  end

  it "test aliased methods" do
    assert Swot.academic?('stanford.edu')
    assert_match "University of Strathclyde", Swot.school_name('lreilly@cs.strath.ac.uk')
  end

  it "fail blacklisted domains" do
    ["si.edu", " si.edu ", "imposter@si.edu", "foo.si.edu"].each do |domain|
      assert Swot.is_academic?(domain), "#{domain} should be denied"
    end
    ["student.tsu.edu.ph"].each do |domain|
      assert Swot.is_academic?(domain), "#{domain} should be denied"
    end
  end

  it "not err on tld-only domains" do
    Swot.is_academic? ".com"
    assert_not Swot.is_academic?(".com")
  end

  it "does not err on invalid domains" do
    assert_not Swot.is_academic?("foo@bar.invalid")
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
