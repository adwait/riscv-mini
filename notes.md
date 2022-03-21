### Tetscases by filename:

- saddtracing:
  - addi r11, r0, 100
  - addi r12, r11, 200
  - addi r12, r11, 200 


### Think about:
- the exact refinement check depends on the observation fruntions from the adversary.



### Main point 1:
- What is the right set of assumes and asserts?
  - this should be decided based on compositionality
  - i.e. one should be able to prove correctness of an overall program that is a composition of snippets
  - so asserts from a previous block should imply assumes of the subsequent block 
  - can this be achieved with a concurrent variant of Hoare logic? 
  - what do the compositional rules look like?


### FV Files:
- Formal.v: this is the original file for verif. of core+icache+dcache
- FormalCore.v: this is coreonly file for verif. of core but with internal code
- FormalCoreTop.v: this is file with an external module used for writing tests based on bmc/pdr
  - this was needed since pdr does not allow constraining inputs (so they must be pulled internal to another module)
  - pdr works for test sans ordering model but TOs on composition with ordering TS
- FormalInduct.v: this is roughly a copy of FormalCoreTop.v but with additional invariants for k-induction ased proofs
  - this works for addi r12, r12, 200, but fails for generic imms (needs more invariants)
  - this is a copy since typically, BMC tests are run with FormalCoreTop for sanity and if it works, induction is tried
