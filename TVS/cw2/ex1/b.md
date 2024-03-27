### Exercise 1

**b) Subsections 1.1.3 and 5.3.1 specify a canonical address form for virtual addresses. With 4-level mapping, canonical addresses go from 0x0000000000000000 to 0x________________ and then from 0x________________ to 0xFFFFFFFFFFFFFFFF. Complete the missing values and write the canonical ranges for 5-level mapping.**

----

A canonical address form is to write the memory address such that the most significant inplemented bit to bit 63 are all 0 or 1.

**4-level mapping**

In the case of 4-level mapping, the most significant implemented bit is bit 47.

0x0000 0000 0000 0000 to 0x0000 7FFF FFFF FFFF (bit 47 at 0)
and
0xFFFF 8000 0000 0000 to 0xFFFF FFFF FFFF FFFF (bit 47 at 1)


**5-level mapping**

In the case of 5-level mapping, the most significant implemented bit is bit 56.

0x0000 0000 0000 0000 to 0x00FF FFFF FFFF FFFF (bit 56 at 0)
and
0xFF00 0000 0000 0000 to 0xFFFF FFFF FFFF FFFF (bit 56 at 1)
