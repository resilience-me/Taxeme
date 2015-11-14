/// @title Taxeme System
/// @author Jeffrey B. Petersen
contract TaxemeSystem {

  struct Taxeme {
    uint32 rate;
    uint size;
    Member creator;
  }

  struct QueueNode {
    address next;

    Taxeme taxeme;
  }

  struct LinkedQueue {
    mapping (address => QueueNode) elements;
    address front;
    address back;
  }

  struct HeapNode {
    address parent;
    address leftChild;
    address rightChild;

    // queued taxemes
    LinkedQueue queue;
    // rate of taxemes in queue
    uint32 rate;
  }

  struct Heap {
    mapping (address => HeapNode) elements;
    address top;
  }

  struct Member {
    uint32 rate;
    Heap taxemes;
  }

  mapping (address => Member) public members;

  /*IMPLEMENT private modifier
    if(msg.sender != address(this)) throw;
  */

  function setTaxRate (uint32 rate) {
    members[msg.sender].rate = rate;
  }

  function getInheritedRate (Member member){
    return member.taxemes.elements[member.taxemes.top].rate;
  }

  function getActiveRate (Member member){
    var inheritedRate = getInheritedRate(member);
    if(member.rate < inheritedRate) return member.rate;
    else return inheritedRate;
  }

  function isPersonalActive(Member member){
    return member.rate < getInheritedRate(member);
  }

  function getInheritedTaxeme(Member member){
    var queue = member.taxemes.elements[member.taxemes.top];
    return queue.elements[queue.front].taxeme;
  }

  /*
  IMPLEMENT functions for handling data structures

  remove top of heap
  add to heap
  remove front of queue
  add to queue

  IMPLEMENT functions for handling taxemes

  add volume to taxeme
  add taxeme
  remove taxeme
  remove volume from taxeme

  IMPLEMENT functions for handling transactions

  break each taxed send down into a series of
  partial sends: exhaust active taxeme if possible
  final send: partially exhaust active taxeme
  */

  function taxedSend (address sendTo) {
    // get sent value
    var amount = msg.value;
    var sender = members[msg.sender];
    var receiver = members[sendTo];

    // pay tax on remaining value, pass taxeme volume, and repeat until no remaining value
    while (amount > 0) {
      // if receiver's personal taxeme is active
      if(isPersonalActive(receiver)){
        //IMPLEMENT
      // else receiver's active taxeme is at the top of the heap
      } else {
        var taxeme = getInheritedTaxeme(member);
        // if receiver's active taxeme will not be exhausted by remaining amount
        if (amount < taxeme.size) {
          //IMPLEMENT
        // else receiver's active taxeme will be exhausted by remaining amount
        } else {
          //IMPLEMENT
        }
      }
    }
  }
}
