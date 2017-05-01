require('spec_helper')

describe(List) do
  describe('.all') do
    it('starts off with no lists') do
      expect(List.all()).to(eq([]))
    end
  end

  describe('#name') do
    it("tells you its name") do
      test_list = List.new({:name => "Brian", :id => nil})
      expect(test_list.name()).to(eq("Brian"))
    end
  end

  describe('#id') do
    it('tells you its id') do
      test_list = List.new(:name => "Brian", :id=> nil )
      test_list.save()
      expect(test_list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it('lets you save lists to the database') do
      test_list = List.new({:name => "Brian", :id => nil })
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end

  describe('#==') do
    it("is the same list if it has the same name") do
    list1 = List.new({:name => "Brian", :id => nil})
    list2 = List.new({:name => "Brian", :id => nil})
    expect(list1).to(eq(list2))
    end
  end

end
