#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/botswana-national-assembly-wp', column: 'wikiname')

# Find all P39s of the 11th Parliament
query = <<EOS
  SELECT DISTINCT ?item
  WHERE
  {
    BIND(wd:Q21290847 AS ?membership)
    BIND(wd:Q29783950 AS ?term)

    ?item p:P39 ?position_statement .
    ?position_statement ps:P39 ?membership .
    ?position_statement pq:P2937 ?term .
  }
EOS
p39s = EveryPolitician::Wikidata.sparql(query)

EveryPolitician::Wikidata.scrape_wikidata(ids: p39s, names: { en: names })
