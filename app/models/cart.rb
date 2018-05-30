class Cart
  attr_reader :contents

  def initialize(data = Hash.new(0))
    @contents = data
  end

  def total_count
    @contents.values.sum if @contents
  end

  def add_item(item)
    item_id = item.id.to_s
    if @contents && @contents[item_id]
      @contents[item_id] += 1
    end
  end

  def item_count(id)
    @contents[id]
  end
end
