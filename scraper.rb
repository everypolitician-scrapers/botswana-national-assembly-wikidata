#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'


names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/botswana-national-assembly-wp', column: 'wikiname')
EveryPolitician::Wikidata.scrape_wikidata(names: { en: names }, output: false)
warn EveryPolitician::Wikidata.notify_rebuilder
