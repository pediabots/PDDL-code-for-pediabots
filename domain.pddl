Domain File:

(define (domain microbot-tumor)
  (:predicates (tissue ?t) (microbot ?m) (tumor ?tumor) (at ?obj ?t)
               (free ?m) (carry ?obj ?m))

  (:action move
   :parameters (?from ?to ?m)
   :precondition (and (tissue ?from)
                      (tissue ?to)
                      (microbot ?m)
                      (at ?m ?from))
   :effect (and (at ?m ?to)
                (not (at ?m ?from))))

  (:action pick
   :parameters (?tumor ?tissue ?m)
   :precondition (and (tumor ?tumor)
                      (tissue ?tissue)
                      (microbot ?m)
                      (at ?tumor ?tissue)
                      (at ?m ?tissue)
                      (free ?m))
   :effect (and (carry ?tumor ?m)
                (not (at ?tumor ?tissue))
                (not (free ?m))))

  (:action drop
   :parameters (?tumor ?tissue ?m)
   :precondition (and (tumor ?tumor)
                      (tissue ?tissue)
                      (microbot ?m)
                      (carry ?tumor ?m)
                      (at ?m ?tissue))
   :effect (and (at ?tumor ?tissue)
                (free ?m)
                (not (carry ?tumor ?m)))))
