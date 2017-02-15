class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next
    @next.prev = @prev
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @tail.prev = @head
    @head.next = @tail
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    link = get_link(key)
    link ? link.val : nil
  end

  def include?(key)
    !get_link(key).nil?
  end

  def insert(key, val)
    present = get_link(key)

    if present
      present.val = val
      present
    else
      new_link = Link.new(key, val)
      prev_link = @tail.prev

      new_link.prev = prev_link
      prev_link.next = new_link

      new_link.next = @tail
      @tail.prev = new_link

      new_link
    end
  end

  def remove(key)
    link = get_link(key)

    if link
      link.remove
      link.val
    else
      nil
    end
  end

  def each(&prc)
    crawler = @head.next

    until crawler == @tail
      prc.call(crawler)
      crawler = crawler.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end

  private

  def get_link(key)
    self.each do |link|
      return link if link.key == key
    end
    nil
  end
end
