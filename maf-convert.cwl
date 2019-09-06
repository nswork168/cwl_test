cwlVersion: v1.0
class: CommandLineTool
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/last:982--hdbcaa40_0
baseCommand: [maf-convert]
arguments:
  - -d
  - -r
  - "ID:$sample      SM:$sample      PL:Illumina" 
  - sam
  - $(inputs.maf_file.path)
inputs:
    - id: maf_file
      type: File
outputs:

    - id: outputsam
      type: stdout
stdout: $(inputs.maf_file.nameroot).sam
