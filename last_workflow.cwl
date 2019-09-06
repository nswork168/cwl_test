cwlVersion: v1.0
class: Workflow
doc: last workflow
inputs: 
    fastq_file_1:
            type: File
    fastq_file_2:
            type: File
    prj_file:
            type: File
            secondaryFiles:
                - ^.tis
                - ^.des
                - ^.bck
                - ^.sds
                - ^.ssp
                - ^.suf

steps:
  lastal_1:
    run: lastal.cwl
    in:
      - id: source
        source: fastq_file_1
      - id: dbname
        source: prj_file
      - id: query_sequences
        default: 1 
      - id: minimum_alignment_score
        default: 120 
      - id: batches
        default: 1  
    out: [outputmaf]

  lastal_2:
    run: lastal.cwl
    in:
      - id: source
        source: fastq_file_2
      - id: dbname
        source: prj_file
      - id: query_sequences
        default: 1 
      - id: minimum_alignment_score
        default: 120 
      - id: batches
        default: 1  
    out: [outputmaf]

  last_pair_probes:
    run: last-pair-probs.cwl
    in:
      - id: maf_file1
        source: lastal_1/outputmaf

      - id: maf_file2
        source: lastal_2/outputmaf    

      - id: mismap
        default: 0.4
    out: [outputmaf]

  maf-convert:
    run: maf-convert.cwl
    in:
      - id: maf_file
        source: last_pair_probes/outputmaf
    out: [outputsam]


outputs:
  merged_sam_file:
    type: File
    outputSource: maf-convert/outputsam