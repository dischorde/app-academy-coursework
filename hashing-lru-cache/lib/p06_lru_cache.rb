require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    link = @map.get(key)
    if link
      update_link!(link)
    else
      eject! if count == @max
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = @prc.call(key)
    link = @store.insert(key, val)
    @map[key] = link
    val
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    link.remove
    last = @store.last
    tail = last.next

    link.next = tail
    link.prev = last

    last.next = link
    tail.prev = link

    link.val
  end

  def eject!
    oldest = @store.first
    @map.delete(oldest.key)
    oldest.remove
  end
end
