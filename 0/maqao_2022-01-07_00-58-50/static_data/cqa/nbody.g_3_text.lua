_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - VCVTPD2PS: 2 occurrences\n - VCVTPS2PD: 2 occurrences\n - VINSERTF128: 3 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VEXTRACTF128: 1 occurrences\n - VINSERTF128: 4 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 5 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = " - VCVTPD2PS (FP64 to FP32, SIMD): 2 occurrences\n - VCVTPS2PD (FP32 to FP64, SIMD): 2 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "20 AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (eight at a time).\n4 AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 176 FP arithmetical operations:\n - 88: addition or subtraction\n - 72: multiply\n - 8: fast reciprocal\n - 8: square root\nThe binary loop is loading 96 bytes (24 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.83 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 39\nnb uops            : 45\nloop length        : 182\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 3\nused ymm registers : 14\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.10\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 9.00 cycles\nfront end            : 9.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6   | P7   | P8   | P9\n------------------------------------------------------------------------------\nuops   | 14.00 | 14.00 | 3.00 | 3.00 | 0.00 | 9.00 | 2.00 | 0.00 | 0.00 | 0.00\ncycles | 14.00 | 14.00 | 3.00 | 3.00 | 0.00 | 9.00 | 2.00 | 0.00 | 0.00 | 0.00\n\nCycles executing div or sqrt instructions: 18.00-24.00\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 9.00\nDispatch  : 14.00\nDIV/SQRT  : 18.00-24.00\nData deps.: 4.00\nOverall L1: 18.00-24.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 100%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 100%\nother   : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 43%\nload    : 25%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 50%\nadd-sub : 50%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 50%\nother   : 30%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.00 cycles. At this rate:\n - 3% of peak load performance is reached (4.00 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1730\n\nInstruction                                    | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | P8 | P9 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------------------------------\nVMOVUPS (%RCX,%RDI,1),%XMM5                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 0  | 0  | 3       | 0.50\nVINSERTF128 $0x1,0x10(%RCX,%RDI,1),%YMM5,%YMM3 | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 0  | 0  | 5       | 0.50\nVMOVUPS (%RDX,%RDI,1),%XMM5                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 0  | 0  | 3       | 0.50\nVINSERTF128 $0x1,0x10(%RDX,%RDI,1),%YMM5,%YMM2 | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 0  | 0  | 5       | 0.50\nVSUBPS %YMM15,%YMM3,%YMM3                      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMOVUPS (%RAX,%RDI,1),%XMM5                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 0  | 0  | 3       | 0.50\nVINSERTF128 $0x1,0x10(%RAX,%RDI,1),%YMM5,%YMM0 | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 0  | 0  | 5       | 0.50\nADD $0x20,%RDI                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 0  | 0  | 1       | 0.25\nVSUBPS %YMM14,%YMM2,%YMM2                      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVSUBPS %YMM13,%YMM0,%YMM4                      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMULPS %YMM3,%YMM3,%YMM1                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMULPS %YMM2,%YMM2,%YMM0                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVADDPS %YMM1,%YMM0,%YMM0                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMULPS %YMM4,%YMM4,%YMM1                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVADDPS %YMM10,%YMM1,%YMM1                      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVADDPS %YMM1,%YMM0,%YMM0                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVCVTPS2PD %XMM0,%YMM9                          | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 7       | 1\nVEXTRACTF128 $0x1,%YMM0,%XMM0                  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 3       | 1\nVSQRTPD %YMM9,%YMM1                            | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 13-19   | 9-12\nVCVTPS2PD %XMM0,%YMM0                          | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 7       | 1\nVSQRTPD %YMM0,%YMM5                            | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 13-19   | 9-12\nVMULPD %YMM9,%YMM1,%YMM1                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMULPD %YMM0,%YMM5,%YMM0                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVCVTPD2PS %YMM1,%XMM1                          | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 7       | 1\nVCVTPD2PS %YMM0,%XMM0                          | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 7       | 1\nVINSERTF128 $0x1,%XMM0,%YMM1,%YMM1             | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 3       | 1\nVRCPPS %YMM1,%YMM0                             | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nVMULPS %YMM1,%YMM0,%YMM1                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMULPS %YMM1,%YMM0,%YMM1                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVADDPS %YMM0,%YMM0,%YMM0                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVSUBPS %YMM1,%YMM0,%YMM0                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMULPS %YMM3,%YMM0,%YMM3                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMULPS %YMM2,%YMM0,%YMM2                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMULPS %YMM4,%YMM0,%YMM0                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVADDPS %YMM3,%YMM6,%YMM6                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVADDPS %YMM2,%YMM7,%YMM7                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVADDPS %YMM0,%YMM8,%YMM8                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nCMP %RDI,%R12                                  | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 0  | 0  | 1       | 0.25\nJNE 1730 <move_particles._omp_fn.0+0x120>      | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0  | 0  | 0       | 0.50-1\n",
        },
      },
      header = {
        "11% of peak computational performance is used (7.33 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 43% register length (average across all SSE/AVX instructions).\n",
        },
        {
          workaround = "Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 24.00 to 14.00 cycles (1.71x speedup).\n",
        },
      },
      potential = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).\n",
          title = "FMA",
          txt = "Presence of both ADD/SUB and MUL operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - VCVTPD2PS: 2 occurrences\n - VCVTPS2PD: 2 occurrences\n - VINSERTF128: 3 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - VEXTRACTF128: 1 occurrences\n - VINSERTF128: 4 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 5 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = " - VCVTPD2PS (FP64 to FP32, SIMD): 2 occurrences\n - VCVTPS2PD (FP32 to FP64, SIMD): 2 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "20 AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (eight at a time).\n4 AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 176 FP arithmetical operations:\n - 88: addition or subtraction\n - 72: multiply\n - 8: fast reciprocal\n - 8: square root\nThe binary loop is loading 96 bytes (24 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.83 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 39\nnb uops            : 45\nloop length        : 182\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 3\nused ymm registers : 14\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.10\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 9.00 cycles\nfront end            : 9.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6   | P7   | P8   | P9\n------------------------------------------------------------------------------\nuops   | 14.00 | 14.00 | 3.00 | 3.00 | 0.00 | 9.00 | 2.00 | 0.00 | 0.00 | 0.00\ncycles | 14.00 | 14.00 | 3.00 | 3.00 | 0.00 | 9.00 | 2.00 | 0.00 | 0.00 | 0.00\n\nCycles executing div or sqrt instructions: 18.00-24.00\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 9.00\nDispatch  : 14.00\nDIV/SQRT  : 18.00-24.00\nData deps.: 4.00\nOverall L1: 18.00-24.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 100%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 100%\nother   : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 43%\nload    : 25%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 50%\nadd-sub : 50%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 50%\nother   : 30%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 24.00 cycles. At this rate:\n - 3% of peak load performance is reached (4.00 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1730\n\nInstruction                                    | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | P8 | P9 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------------------------------\nVMOVUPS (%RCX,%RDI,1),%XMM5                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 0  | 0  | 3       | 0.50\nVINSERTF128 $0x1,0x10(%RCX,%RDI,1),%YMM5,%YMM3 | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 0  | 0  | 5       | 0.50\nVMOVUPS (%RDX,%RDI,1),%XMM5                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 0  | 0  | 3       | 0.50\nVINSERTF128 $0x1,0x10(%RDX,%RDI,1),%YMM5,%YMM2 | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 0  | 0  | 5       | 0.50\nVSUBPS %YMM15,%YMM3,%YMM3                      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMOVUPS (%RAX,%RDI,1),%XMM5                    | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 0  | 0  | 3       | 0.50\nVINSERTF128 $0x1,0x10(%RAX,%RDI,1),%YMM5,%YMM0 | 2     | 0.33 | 0.33 | 0.50 | 0.50 | 0  | 0.33 | 0    | 0  | 0  | 0  | 5       | 0.50\nADD $0x20,%RDI                                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 0  | 0  | 1       | 0.25\nVSUBPS %YMM14,%YMM2,%YMM2                      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVSUBPS %YMM13,%YMM0,%YMM4                      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMULPS %YMM3,%YMM3,%YMM1                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMULPS %YMM2,%YMM2,%YMM0                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVADDPS %YMM1,%YMM0,%YMM0                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMULPS %YMM4,%YMM4,%YMM1                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVADDPS %YMM10,%YMM1,%YMM1                      | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVADDPS %YMM1,%YMM0,%YMM0                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVCVTPS2PD %XMM0,%YMM9                          | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 7       | 1\nVEXTRACTF128 $0x1,%YMM0,%XMM0                  | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 3       | 1\nVSQRTPD %YMM9,%YMM1                            | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 13-19   | 9-12\nVCVTPS2PD %XMM0,%YMM0                          | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 7       | 1\nVSQRTPD %YMM0,%YMM5                            | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 13-19   | 9-12\nVMULPD %YMM9,%YMM1,%YMM1                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMULPD %YMM0,%YMM5,%YMM0                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVCVTPD2PS %YMM1,%XMM1                          | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 7       | 1\nVCVTPD2PS %YMM0,%XMM0                          | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 7       | 1\nVINSERTF128 $0x1,%XMM0,%YMM1,%YMM1             | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 3       | 1\nVRCPPS %YMM1,%YMM0                             | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nVMULPS %YMM1,%YMM0,%YMM1                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMULPS %YMM1,%YMM0,%YMM1                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVADDPS %YMM0,%YMM0,%YMM0                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVSUBPS %YMM1,%YMM0,%YMM0                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMULPS %YMM3,%YMM0,%YMM3                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMULPS %YMM2,%YMM0,%YMM2                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVMULPS %YMM4,%YMM0,%YMM0                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVADDPS %YMM3,%YMM6,%YMM6                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVADDPS %YMM2,%YMM7,%YMM7                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nVADDPS %YMM0,%YMM8,%YMM8                       | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nCMP %RDI,%R12                                  | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 0  | 0  | 1       | 0.25\nJNE 1730 <move_particles._omp_fn.0+0x120>      | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0  | 0  | 0       | 0.50-1\n",
        },
      },
      header = {
        "11% of peak computational performance is used (7.33 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 43% register length (average across all SSE/AVX instructions).\n",
        },
        {
          workaround = "Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 24.00 to 14.00 cycles (1.71x speedup).\n",
        },
      },
      potential = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).\n",
          title = "FMA",
          txt = "Presence of both ADD/SUB and MUL operations.",
        },
      },
    },
  common = {
    header = {
      "",
    },
    nb_paths = 1,
  },
}
