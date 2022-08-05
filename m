Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A602C58B00A
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Aug 2022 20:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236448AbiHESvH (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 5 Aug 2022 14:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241229AbiHESuy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 5 Aug 2022 14:50:54 -0400
X-Greylist: delayed 2644 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 05 Aug 2022 11:50:33 PDT
Received: from blackstone.apzort.in (unknown [202.142.85.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 717AC183AD
        for <linux-hwmon@vger.kernel.org>; Fri,  5 Aug 2022 11:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anurav.com;
        s=default; h=Content-Type:MIME-Version:Message-ID:Reply-To:From:Date:Subject:
        To:Sender:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=rtJPzLLqWKT17lmLSrHgenv2z72ZF1eJmLqhTuTV3u0=; b=En/9NDIpPzmRdt9B63efYf3KSn
        HWjBr5yUUFyMide0DMgAEw4KMZPYgfbCTv9U5oGzjl/44FAWCLqL1fyx6W+AvmGa8UpdoAZG48DAh
        KDhsceTLQ3TKmnM1m5rWwiaBauhdDJfQo6ytGObrxwXRxAPexTkz7nAhl3VARnu0vAZ53RWK7/7l5
        SAK+2uD0u2hGZGQrfJwMYJMHP7rzWGWOegUZFtRVieQL7P0HzF2GRKX6TAj+GSqU03Z90Bk26CB7Y
        rYBxDM07Y0DDUfeHH8yTUnsptSXqZe3PFqHJNL/Lu4Pa268TKmCL294ETPR2AxsKuoo1iTibyk4U3
        bPflyS2A==;
Received: from apzort by blackstone.apzort.in with local (Exim 4.94.2)
        (envelope-from <apzort@blackstone.apzort.in>)
        id 1oK1i7-001gkt-O6
        for linux-hwmon@vger.kernel.org; Fri, 05 Aug 2022 23:36:11 +0530
To:     linux-hwmon@vger.kernel.org
Subject: =?us-ascii?Q?Anurav_Dhwaj__"THE_WORLD_FINANCIAL_CRISIS_CAN_M?=  =?us-ascii?Q?AKE_YOU_A_MILLIONAIRE!"?=
X-PHP-Script: www.anurav.com/index.php for 191.101.31.49
X-PHP-Originating-Script: 1000:PHPMailer.php
Date:   Fri, 5 Aug 2022 18:06:11 +0000
From:   Anurav Dhwaj <mail@anurav.com>
Reply-To: mail@anurav.com
Message-ID: <xIknnYlVFVvqK86IoyRlPD0KPMI4Tb4FadqwMxRtkM@www.anurav.com>
X-Mailer: PHPMailer 6.6.0 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - blackstone.apzort.in
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [1000 989] / [47 12]
X-AntiAbuse: Sender Address Domain - blackstone.apzort.in
X-Get-Message-Sender-Via: blackstone.apzort.in: authenticated_id: apzort/from_h
X-Authenticated-Sender: blackstone.apzort.in: mail@anurav.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: Yes, score=7.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PHP_SCRIPT,
        RCVD_IN_PBL,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  3.3 RCVD_IN_PBL RBL: Received via a relay in Spamhaus PBL
        *      [202.142.85.54 listed in zen.spamhaus.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
        *      mail domains are different
        * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.3 PHP_SCRIPT Sent by PHP script
        *  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Message Body:
INVEST TODAY AND BECOME THE NEXT BILLIONAIRE... https://telegra.ph/Cryptocurrency-makes-people-millionaires-at-15-people-per-hour---Page-855009-08-02

-- 
This e-mail was sent from a contact form on Anurav Dhwaj  (https://www.anurav.com)

