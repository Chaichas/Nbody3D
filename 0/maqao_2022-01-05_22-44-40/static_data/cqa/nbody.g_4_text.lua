_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = "Pass to your compiler a micro-architecture specialization option:\n - Please read your compiler manual\n",
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - CVTPD2PS: 2 occurrences\n - CVTPS2PD: 2 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - MOVUPS: 3 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 3 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = " - CVTPD2PS (FP64 to FP32, SIMD): 2 occurrences\n - CVTPS2PD (FP32 to FP64, SIMD): 2 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "20 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (four at a time).\n4 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (two at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 88 FP arithmetical operations:\n - 44: addition or subtraction\n - 36: multiply\n - 4: fast reciprocal\n - 4: square root\nThe binary loop is loading 48 bytes (12 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.83 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 39\nnb uops            : 42\nloop length        : 141\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 15\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.10\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 8.40 cycles\nfront end            : 8.40 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6   | P7   | P8   | P9\n------------------------------------------------------------------------------\nuops   | 14.00 | 14.00 | 1.50 | 1.50 | 0.00 | 6.00 | 2.00 | 0.00 | 0.00 | 0.00\ncycles | 14.00 | 14.00 | 1.50 | 1.50 | 0.00 | 6.00 | 2.00 | 0.00 | 0.00 | 0.00\n\nCycles executing div or sqrt instructions: 9.00-12.00\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 8.40\nDispatch  : 14.00\nDIV/SQRT  : 9.00-12.00\nData deps.: 4.00\nOverall L1: 14.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 100%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 100%\nother   : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 23%\nload    : 25%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 25%\nadd-sub : 25%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 25%\nother   : 19%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 14.00 cycles. At this rate:\n - 2% of peak load performance is reached (3.43 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1788\n\nInstruction                    | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | P8 | P9 | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------------------\nMOVUPS (%RCX,%RAX,1),%XMM3     | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 0  | 0  | 3       | 0.50\nMOVUPS (%RSI,%RAX,1),%XMM2     | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 0  | 0  | 3       | 0.50\nMOVUPS (%R8,%RAX,1),%XMM4      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 0  | 0  | 3       | 0.50\nADD $0x10,%RAX                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 0  | 0  | 1       | 0.25\nSUBPS %XMM12,%XMM3             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nSUBPS %XMM11,%XMM2             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nSUBPS %XMM10,%XMM4             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nMOVAPS %XMM2,%XMM0             | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 0       | 0.25\nMOVAPS %XMM3,%XMM1             | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 0       | 0.25\nMULPS %XMM3,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nMULPS %XMM2,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nADDPS %XMM1,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nMOVAPS %XMM4,%XMM1             | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 0       | 0.25\nMULPS %XMM4,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nADDPS %XMM14,%XMM1             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nADDPS %XMM1,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nMOVHLPS %XMM0,%XMM15           | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 1       | 1\nCVTPS2PD %XMM0,%XMM9           | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 5       | 1\nSQRTPD %XMM9,%XMM1             | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 13-19   | 4.50-6\nCVTPS2PD %XMM15,%XMM5          | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 5       | 1\nMULPD %XMM9,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nSQRTPD %XMM5,%XMM0             | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 13-19   | 4.50-6\nMULPD %XMM5,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nCVTPD2PS %XMM1,%XMM1           | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 5       | 1\nCVTPD2PS %XMM0,%XMM0           | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 5       | 1\nMOVLHPS %XMM0,%XMM1            | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 1       | 1\nRCPPS %XMM1,%XMM0              | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nMULPS %XMM0,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nMULPS %XMM0,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nADDPS %XMM0,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nSUBPS %XMM1,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nMULPS %XMM0,%XMM3              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nMULPS %XMM0,%XMM2              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nMULPS %XMM4,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nADDPS %XMM3,%XMM6              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nADDPS %XMM2,%XMM7              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nADDPS %XMM0,%XMM8              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nCMP %R9,%RAX                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 0  | 0  | 1       | 0.25\nJNE 1788 <move_particles+0xb8> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0  | 0  | 0       | 0.50-1\n",
        },
      },
      header = {
        "9% of peak computational performance is used (6.29 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 23% register length (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 14.00 to 6.00 cycles (2.33x speedup).",
        },
        {
          workaround = " - Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n - Reduce the number of FP add instructions\n - Reduce the number of FP multiply/FMA instructions\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by:\n - execution of divide and square root operations (the divide/square root unit is a bottleneck)\n - execution of FP add operations (the FP add unit is a bottleneck)\n - execution of FP multiply or FMA (fused multiply-add) operations (the FP multiply/FMA unit is a bottleneck)\n",
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
          workaround = "Pass to your compiler a micro-architecture specialization option:\n - Please read your compiler manual\n",
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - CVTPD2PS: 2 occurrences\n - CVTPS2PD: 2 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = " - MOVUPS: 3 occurrences\n",
          title = "Vector unaligned load/store instructions",
          txt = "Detected 3 suboptimal vector unaligned load/store instructions.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = " - CVTPD2PS (FP64 to FP32, SIMD): 2 occurrences\n - CVTPS2PD (FP32 to FP64, SIMD): 2 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "20 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in vector mode (four at a time).\n4 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (two at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 88 FP arithmetical operations:\n - 44: addition or subtraction\n - 36: multiply\n - 4: fast reciprocal\n - 4: square root\nThe binary loop is loading 48 bytes (12 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.83 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 39\nnb uops            : 42\nloop length        : 141\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 15\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 1.10\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 8.40 cycles\nfront end            : 8.40 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0    | P1    | P2   | P3   | P4   | P5   | P6   | P7   | P8   | P9\n------------------------------------------------------------------------------\nuops   | 14.00 | 14.00 | 1.50 | 1.50 | 0.00 | 6.00 | 2.00 | 0.00 | 0.00 | 0.00\ncycles | 14.00 | 14.00 | 1.50 | 1.50 | 0.00 | 6.00 | 2.00 | 0.00 | 0.00 | 0.00\n\nCycles executing div or sqrt instructions: 9.00-12.00\nLongest recurrence chain latency (RecMII): 4.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 8.40\nDispatch  : 14.00\nDIV/SQRT  : 9.00-12.00\nData deps.: 4.00\nOverall L1: 14.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 100%\nload    : 100%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 100%\nadd-sub : 100%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 100%\nother   : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 23%\nload    : 25%\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : 25%\nadd-sub : 25%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 25%\nother   : 19%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 14.00 cycles. At this rate:\n - 2% of peak load performance is reached (3.43 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1788\n\nInstruction                    | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7 | P8 | P9 | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------------------------\nMOVUPS (%RCX,%RAX,1),%XMM3     | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 0  | 0  | 3       | 0.50\nMOVUPS (%RSI,%RAX,1),%XMM2     | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 0  | 0  | 3       | 0.50\nMOVUPS (%R8,%RAX,1),%XMM4      | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0  | 0  | 0  | 3       | 0.50\nADD $0x10,%RAX                 | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 0  | 0  | 1       | 0.25\nSUBPS %XMM12,%XMM3             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nSUBPS %XMM11,%XMM2             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nSUBPS %XMM10,%XMM4             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nMOVAPS %XMM2,%XMM0             | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 0       | 0.25\nMOVAPS %XMM3,%XMM1             | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 0       | 0.25\nMULPS %XMM3,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nMULPS %XMM2,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nADDPS %XMM1,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nMOVAPS %XMM4,%XMM1             | 1     | 0    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 0       | 0.25\nMULPS %XMM4,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nADDPS %XMM14,%XMM1             | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nADDPS %XMM1,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nMOVHLPS %XMM0,%XMM15           | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 1       | 1\nCVTPS2PD %XMM0,%XMM9           | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 5       | 1\nSQRTPD %XMM9,%XMM1             | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 13-19   | 4.50-6\nCVTPS2PD %XMM15,%XMM5          | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 5       | 1\nMULPD %XMM9,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nSQRTPD %XMM5,%XMM0             | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 13-19   | 4.50-6\nMULPD %XMM5,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nCVTPD2PS %XMM1,%XMM1           | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 5       | 1\nCVTPD2PS %XMM0,%XMM0           | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 5       | 1\nMOVLHPS %XMM0,%XMM1            | 1     | 0    | 0    | 0    | 0    | 0  | 1    | 0    | 0  | 0  | 0  | 1       | 1\nRCPPS %XMM1,%XMM0              | 1     | 1    | 0    | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nMULPS %XMM0,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nMULPS %XMM0,%XMM1              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nADDPS %XMM0,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nSUBPS %XMM1,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nMULPS %XMM0,%XMM3              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nMULPS %XMM0,%XMM2              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nMULPS %XMM4,%XMM0              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 0.50\nADDPS %XMM3,%XMM6              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nADDPS %XMM2,%XMM7              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nADDPS %XMM0,%XMM8              | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0  | 0  | 0  | 4       | 1\nCMP %R9,%RAX                   | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0  | 0  | 0  | 1       | 0.25\nJNE 1788 <move_particles+0xb8> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0  | 0  | 0  | 0       | 0.50-1\n",
        },
      },
      header = {
        "9% of peak computational performance is used (6.29 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Pass to your compiler a micro-architecture specialization option:\n  * Please read your compiler manual\n - Use vector aligned instructions:\n  1) align your arrays on 64 bytes boundaries\n  2) inform your compiler that your arrays are vector aligned: read your compiler manual.\n",
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\nSince your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 23% register length (average across all SSE/AVX instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 14.00 to 6.00 cycles (2.33x speedup).",
        },
        {
          workaround = " - Reduce the number of division or square root instructions:\n - If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n - Reduce the number of FP add instructions\n - Reduce the number of FP multiply/FMA instructions\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by:\n - execution of divide and square root operations (the divide/square root unit is a bottleneck)\n - execution of FP add operations (the FP add unit is a bottleneck)\n - execution of FP multiply or FMA (fused multiply-add) operations (the FP multiply/FMA unit is a bottleneck)\n",
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
