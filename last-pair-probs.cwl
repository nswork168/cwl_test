cwlVersion: v1.0
class: CommandLineTool
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/last:982--hdbcaa40_0
baseCommand: [last-pair-probs]
arguments:
  - -m$(inputs.mismap)
  - $(inputs.maf_file1)
  - $(inputs.maf_file2)
inputs:
    - id: mismap
      type: double
    - id: maf_file1
      type: File
    - id: maf_file2
      type: File
outputs:
    - id: outputmaf
      type: stdout
stdout: $(inputs.maf_file1.nameroot).merge.maf
