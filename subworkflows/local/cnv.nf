// TODO nf-core: If in doubt look at other nf-core/subworkflows to see how we are doing things! :)
//               https://github.com/nf-core/modules/tree/master/subworkflows
//               You can also ask for help via your pull request or on the #subworkflows channel on the nf-core Slack workspace:
//               https://nf-co.re/join
// TODO nf-core: A subworkflow SHOULD import at least two modules

include { SNPPILEUP } from '../../../modules/local/snppileup'

workflow CNV {

    take:
    // TODO nf-core: edit input (take) channels
    ch_bam // channel: [ val(meta), [ bam ] ]

    main:

    ch_versions = Channel.empty()

    // TODO nf-core: substitute modules here for the modules of your subworkflow

        SNP_PILEUP(
        ch_bams
    )
    ch_versions = ch_versions.mix(SNP_PILEUP.out.versions.first())


    emit:
    // TODO nf-core: edit emitted channels
    pileup      = SNP_PILEUP.out.pileup           // channel: [ val(meta), [ pileup ] ]

    versions = ch_versions                     // channel: [ versions.yml ]
}

