---
title: "Tracking Tuesday’s Ethereum Network Overload"
date: 2018-08-11
categories: [amberdata]
resources:
- name: featured-image
  src: zoltan-tasi-uNXmhzcQjxg-unsplash.jpg

tags: [blockchain, finance]
link: https://medium.com/amberdata/tracking-tuesdays-ethereum-network-overload-2d87c4ac1f93
---
Photo by <a href="https://unsplash.com/@zoltantasi?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Zoltan Tasi</a> on <a href="https://unsplash.com/s/photos/ethereum?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
  
Early this morning, a new address originated a spam attack on the Ethereum network. Inspired by this [article](https://cryptovest.com/news/ethereum-network-overloaded-again-strong-suspicions-of-spam/) on Cryptovest, let’s take a quick look on how the Amberdata platform displays this activity.

The account in question operated transactions consuming upwards of 20% of the network gas usage this morning, taking up large space on the block and slowing the network. Our alert system identified this attack based on high gas costs and large Ether transfers. Notice the huge 1,100 Gwei gas price on the parent transaction:
![](txn_ticket.png "https://amberdata.io/transactions/0x723020b54a82025b5cd5dbd509e6f879786b81bda5456dc87305597203268a3e?size=500")

The contract activity graph on the address’ dashboard shows this morning’s abnormal activity. It was transferred 92.4 Ether at the start of day, and appears to be a part of a bot run system to make high gas transfers on the Ethereum network.
![](contract_activity.png "The contract activity of the account in question. Beginning today, the address has had a peak of almost 5,300 transactions, each costing roughly 20% gas")

This activity is a good use of our new anomaly detection feature which we are excited to roll out in a future release. It is estimated that today’s overload cost roughly $20,000 to those responsible with the effect of slightly higher transaction fee for “fast” transactions, according to the Ethereum gas station.