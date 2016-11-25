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
    # optional but useful, connects previous link to next link
    # and removes self from list.
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
    get_link(key).nil? ? false : true
  end

  def append(key, val)
    new_link = Link.new(key, val)
    new_prev = @tail.prev

    new_link.prev = new_prev
    new_prev.next = new_link

    new_link.next = @tail
    @tail.prev = new_link
  end

  def update(key, val)
    link = get_link(key)
    link.val = val if link
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
