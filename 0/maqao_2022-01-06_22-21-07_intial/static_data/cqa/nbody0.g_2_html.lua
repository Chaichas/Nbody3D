_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n<ul><li>VCVTSD2SS: 1 occurrences</li><li>VCVTSS2SD: 1 occurrences</li></ul>",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "<ul><li>Try to reorganize arrays of structures to structures of arrays</li><li>Consider to permute loops (see vectorization gain report)</li></ul>",
          details = "<ul><li>Constant non-unit stride: 1 occurrence(s)</li></ul>Non-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = "<ul><li>VCVTSD2SS (FP64 to FP32, scalar): 1 occurrences</li><li>VCVTSS2SD (FP32 to FP64, scalar): 1 occurrences</li></ul>",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "16 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n2 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 18 FP arithmetical operations:\n<ul><li>9: addition or subtraction</li><li>7: multiply</li><li>1: divide</li><li>1: square root</li></ul>The binary loop is loading 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.50 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>26</td></tr><tr><td>nb uops</td><td>27</td></tr><tr><td>loop length</td><td>107</td></tr><tr><td>used x86 registers</td><td>2</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>13</td></tr><tr><td>used ymm registers</td><td>0</td></tr><tr><td>used zmm registers</td><td>0</td></tr><tr><td>nb stack references</td><td>0</td></tr><tr><td>ADD-SUB / MUL ratio</td><td>1.29</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\n<table><tr><td>micro-operation queue</td><td>5.40 cycles</td></tr><tr><td>front end</td><td>5.40 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>P8</th><th>P9</th></tr><tr><td>uops</td><td>10.00</td><td>10.00</td><td>1.50</td><td>1.50</td><td>0.00</td><td>2.00</td><td>2.00</td><td>0.00</td><td>0.00</td><td>0.00</td></tr><tr><td>cycles</td><td>10.00</td><td>10.00</td><td>1.50</td><td>1.50</td><td>0.00</td><td>2.00</td><td>2.00</td><td>0.00</td><td>0.00</td><td>0.00</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>7.50-9.00</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>4.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>5.40</td></tr><tr><td>Dispatch</td><td>10.00</td></tr><tr><td>DIV/SQRT</td><td>7.50-9.00</td></tr><tr><td>Data deps.</td><td>4.00</td></tr><tr><td>Overall L1</td><td>10.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "<table><tr><td>all</td><td>0%</td></tr><tr><td>load</td><td>0%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>0%</td></tr><tr><td>add-sub</td><td>0%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>0%</td></tr><tr><td>other</td><td>0%</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "<table><tr><td>all</td><td>7%</td></tr><tr><td>load</td><td>6%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>7%</td></tr><tr><td>add-sub</td><td>6%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>9%</td></tr><tr><td>other</td><td>9%</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 10.00 cycles. At this rate:\n<ul><li>0% of peak load performance is reached (1.20 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))</li></ul>",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1670\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>P8</th><th>P9</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>VMOVSS (%RAX),%XMM5</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td></tr><tr><td>VMOVSS 0x4(%RAX),%XMM4</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td></tr><tr><td>ADD $0x18,%RAX</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>VMOVSS -0x10(%RAX),%XMM3</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td></tr><tr><td>VSUBSS %XMM11,%XMM5,%XMM5</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VSUBSS %XMM10,%XMM4,%XMM4</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VSUBSS %XMM9,%XMM3,%XMM3</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VMULSS %XMM4,%XMM4,%XMM1</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VMULSS %XMM5,%XMM5,%XMM2</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VADDSS %XMM1,%XMM2,%XMM2</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VMULSS %XMM3,%XMM3,%XMM1</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VADDSS %XMM13,%XMM1,%XMM1</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VADDSS %XMM1,%XMM2,%XMM2</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VCVTSS2SD %XMM2,%XMM2,%XMM2</td><td>2</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>VSQRTSD %XMM2,%XMM2,%XMM1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>13-19</td><td>4.50-6</td></tr><tr><td>VMULSD %XMM1,%XMM2,%XMM1</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VCVTSD2SS %XMM1,%XMM1,%XMM1</td><td>2</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>VDIVSS %XMM1,%XMM12,%XMM1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>11</td><td>3</td></tr><tr><td>VMULSS %XMM1,%XMM5,%XMM5</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VMULSS %XMM1,%XMM4,%XMM4</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VMULSS %XMM1,%XMM3,%XMM1</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VADDSS %XMM5,%XMM6,%XMM6</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VADDSS %XMM4,%XMM7,%XMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VADDSS %XMM1,%XMM8,%XMM8</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>CMP %RAX,%RSI</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>JNE 1670 <move_particles+0x50></td><td>1</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50-1</td></tr></table>",
        },
      },
      header = {
        "2% of peak computational performance is used (1.80 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = "<ul><li>Try another compiler or update/tune your current one</li><li>Remove inter-iterations dependences from your loop and make it unit-stride:\n<ul><li>If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly</li><li>If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)</li></ul></li></ul>",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 7% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 10.00 to 1.87 cycles (5.33x speedup).",
        },
        {
          workaround = "<ul><li>Reduce the number of division or square root instructions:\n<ul><li>If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.</li></ul></li><li>Reduce the number of FP add instructions</li><li>Reduce the number of FP multiply/FMA instructions</li></ul>",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by:\n<ul><li>execution of divide and square root operations (the divide/square root unit is a bottleneck)</li><li>execution of FP add operations (the FP add unit is a bottleneck)</li><li>execution of FP multiply or FMA (fused multiply-add) operations (the FP multiply/FMA unit is a bottleneck)</li></ul>",
        },
      },
      potential = {
        {
          workaround = "<ul><li>Pass to your compiler a micro-architecture specialization option:\n<ul><li>Please read your compiler manual</li></ul></li><li>Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).</li></ul>",
          title = "FMA",
          txt = "Presence of both ADD/SUB and MUL operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n<ul><li>VCVTSD2SS: 1 occurrences</li><li>VCVTSS2SD: 1 occurrences</li></ul>",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "<ul><li>Try to reorganize arrays of structures to structures of arrays</li><li>Consider to permute loops (see vectorization gain report)</li></ul>",
          details = "<ul><li>Constant non-unit stride: 1 occurrence(s)</li></ul>Non-unit stride (uncontiguous) accesses are not efficiently using data caches\n",
          title = "Slow data structures access",
          txt = "Detected data structures (typically arrays) that cannot be efficiently read/written",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = "<ul><li>VCVTSD2SS (FP64 to FP32, scalar): 1 occurrences</li><li>VCVTSS2SD (FP32 to FP64, scalar): 1 occurrences</li></ul>",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "16 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n2 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 18 FP arithmetical operations:\n<ul><li>9: addition or subtraction</li><li>7: multiply</li><li>1: divide</li><li>1: square root</li></ul>The binary loop is loading 12 bytes (3 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 1.50 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>26</td></tr><tr><td>nb uops</td><td>27</td></tr><tr><td>loop length</td><td>107</td></tr><tr><td>used x86 registers</td><td>2</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>13</td></tr><tr><td>used ymm registers</td><td>0</td></tr><tr><td>used zmm registers</td><td>0</td></tr><tr><td>nb stack references</td><td>0</td></tr><tr><td>ADD-SUB / MUL ratio</td><td>1.29</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\n<table><tr><td>micro-operation queue</td><td>5.40 cycles</td></tr><tr><td>front end</td><td>5.40 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>P8</th><th>P9</th></tr><tr><td>uops</td><td>10.00</td><td>10.00</td><td>1.50</td><td>1.50</td><td>0.00</td><td>2.00</td><td>2.00</td><td>0.00</td><td>0.00</td><td>0.00</td></tr><tr><td>cycles</td><td>10.00</td><td>10.00</td><td>1.50</td><td>1.50</td><td>0.00</td><td>2.00</td><td>2.00</td><td>0.00</td><td>0.00</td><td>0.00</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>7.50-9.00</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>4.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>5.40</td></tr><tr><td>Dispatch</td><td>10.00</td></tr><tr><td>DIV/SQRT</td><td>7.50-9.00</td></tr><tr><td>Data deps.</td><td>4.00</td></tr><tr><td>Overall L1</td><td>10.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "<table><tr><td>all</td><td>0%</td></tr><tr><td>load</td><td>0%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>0%</td></tr><tr><td>add-sub</td><td>0%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>0%</td></tr><tr><td>other</td><td>0%</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "<table><tr><td>all</td><td>7%</td></tr><tr><td>load</td><td>6%</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>7%</td></tr><tr><td>add-sub</td><td>6%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>9%</td></tr><tr><td>other</td><td>9%</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 10.00 cycles. At this rate:\n<ul><li>0% of peak load performance is reached (1.20 out of 128.00 bytes loaded per cycle (GB/s @ 1GHz))</li></ul>",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1670\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>P8</th><th>P9</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>VMOVSS (%RAX),%XMM5</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td></tr><tr><td>VMOVSS 0x4(%RAX),%XMM4</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td></tr><tr><td>ADD $0x18,%RAX</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>VMOVSS -0x10(%RAX),%XMM3</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td></tr><tr><td>VSUBSS %XMM11,%XMM5,%XMM5</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VSUBSS %XMM10,%XMM4,%XMM4</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VSUBSS %XMM9,%XMM3,%XMM3</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VMULSS %XMM4,%XMM4,%XMM1</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VMULSS %XMM5,%XMM5,%XMM2</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VADDSS %XMM1,%XMM2,%XMM2</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VMULSS %XMM3,%XMM3,%XMM1</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VADDSS %XMM13,%XMM1,%XMM1</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VADDSS %XMM1,%XMM2,%XMM2</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VCVTSS2SD %XMM2,%XMM2,%XMM2</td><td>2</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>VSQRTSD %XMM2,%XMM2,%XMM1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>13-19</td><td>4.50-6</td></tr><tr><td>VMULSD %XMM1,%XMM2,%XMM1</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VCVTSD2SS %XMM1,%XMM1,%XMM1</td><td>2</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td><td>1</td></tr><tr><td>VDIVSS %XMM1,%XMM12,%XMM1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>11</td><td>3</td></tr><tr><td>VMULSS %XMM1,%XMM5,%XMM5</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VMULSS %XMM1,%XMM4,%XMM4</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VMULSS %XMM1,%XMM3,%XMM1</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VADDSS %XMM5,%XMM6,%XMM6</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VADDSS %XMM4,%XMM7,%XMM7</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>VADDSS %XMM1,%XMM8,%XMM8</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td><td>0.50</td></tr><tr><td>CMP %RAX,%RSI</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>JNE 1670 <move_particles+0x50></td><td>1</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50-1</td></tr></table>",
        },
      },
      header = {
        "2% of peak computational performance is used (1.80 out of 64.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = "<ul><li>Try another compiler or update/tune your current one</li><li>Remove inter-iterations dependences from your loop and make it unit-stride:\n<ul><li>If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly</li><li>If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)</li></ul></li></ul>",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 7% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 10.00 to 1.87 cycles (5.33x speedup).",
        },
        {
          workaround = "<ul><li>Reduce the number of division or square root instructions:\n<ul><li>If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.</li></ul></li><li>Reduce the number of FP add instructions</li><li>Reduce the number of FP multiply/FMA instructions</li></ul>",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by:\n<ul><li>execution of divide and square root operations (the divide/square root unit is a bottleneck)</li><li>execution of FP add operations (the FP add unit is a bottleneck)</li><li>execution of FP multiply or FMA (fused multiply-add) operations (the FP multiply/FMA unit is a bottleneck)</li></ul>",
        },
      },
      potential = {
        {
          workaround = "<ul><li>Pass to your compiler a micro-architecture specialization option:\n<ul><li>Please read your compiler manual</li></ul></li><li>Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).</li></ul>",
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
