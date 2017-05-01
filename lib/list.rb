class List
  attr_accessor(:name, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    all_lists = DB.exec("SELECT * FROM lists;")
    saved_lists = []
    all_lists.each() do |list|
      name = list.fetch('name')
      id = list.fetch('id').to_i()
      each_list = List.new({:name => name, :id => id})
      saved_lists.push(each_list)
    end
    saved_lists
  end


  def save
    DB.exec("INSERT INTO lists (name) VALUES ('#{@name}');")
  end

  def id
    result = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  def ==(another_list)
    self.name() == another_list.name()
  end
end
