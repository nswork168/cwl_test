cwlVersion: v1.0
class: CommandLineTool
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/last:982--hdbcaa40_0
baseCommand: [lastal]
arguments:
  - -Q$(inputs.query_sequences)
  - -e$(inputs.minimum_alignment_score)
  - -i$(inputs.batches)
  - $(inputs.dbname.dirname)/$(inputs.dbname.nameroot)
  - $(inputs.source)
inputs:
    - id: query_sequences
      type: int
    - id: minimum_alignment_score
      type: int
    - id: batches
      type: int
    - id: dbname
      type: File # .prj
      secondaryFiles:
        - ^.tis
        - ^.des
        - ^.bck
        - ^.sds
        - ^.ssp
        - ^.suf
    - id: source
      type: File
outputs:
    - id: outputmaf
      type: stdout
stdout: $(inputs.source.nameroot).maf
