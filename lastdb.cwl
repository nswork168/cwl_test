cwlVersion: v1.0
class: CommandLineTool
requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/last:982--hdbcaa40_0
baseCommand: [lastdb]
arguments: [-u$(inputs.seeding_scheme), -R$(inputs.repeats), $(inputs.dbname),  $(inputs.source)]
inputs:
    - id: seeding_scheme
      type: string
    - id: repeats
      type: string
    - id: dbname
      type: string
    - id: source
      type: File
outputs:
    - id: outputdb
      type: File[]
      outputBinding:
         glob: "*"

