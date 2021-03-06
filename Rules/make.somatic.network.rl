rule make_somatic_network:
    input: vcf="germline_snps.vcf"
    output: network="sample_network.bmp",
            vcf="samples_and_knowns.vcf"
    params: gatk=config['bin'][pfamily]['GATK'],genome=config['references'][pfamily]['GENOME'],knowns=config['references'][pfamily]['KNOWNANCESTRY'],rname="make.somatic.network"
    shell: """
         {params.gatk} -T CombineVariants -R {params.genome} --filteredrecordsmergetype KEEP_UNCONDITIONAL --genotypemergeoption UNIQUIFY -o {output.vcf} --variant {params.knowns} --variant {input.vcf} --minimumN 2; perl Scripts/make_sample_network.pl {output.vcf}

           """