Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AAF462EAA0
	for <lists+linux-hwmon@lfdr.de>; Fri, 18 Nov 2022 01:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232330AbiKRA5O (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 17 Nov 2022 19:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240477AbiKRA5N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Nov 2022 19:57:13 -0500
X-Greylist: delayed 906 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 17 Nov 2022 16:57:09 PST
Received: from mail-mgmt.man.olsztyn.pl (mail-mgmt.man.olsztyn.pl [213.184.16.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE56F7EBE9
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Nov 2022 16:57:09 -0800 (PST)
Received: from moskit.uwm.edu.pl (moskit.uwm.edu.pl [213.73.22.212])
        by mail-mgmt.man.olsztyn.pl  with ESMTP id 2AI0fLqq023182-2AI0fLqs023182
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 18 Nov 2022 01:41:21 +0100
Received: from moskit.uwm.edu.pl ([213.73.22.212]:36013)
        by moskit.uwm.edu.pl with esmtpa (Exim 4.89 (FreeBSD))
        (envelope-from <helena.pociechina@uwm.edu.pl>)
        id 1ovpMS-0006mm-1a; Fri, 18 Nov 2022 01:36:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 17 Nov 2022 16:36:04 -0800
From:   Manuel Franco <edward.rogowski@gmx.de>
To:     undisclosed-recipients:;
Subject: =?UTF-8?Q?Sch=C3=B6nen_Tag?=
Reply-To: admplga765@rogers.com
Mail-Reply-To: admplga765@rogers.com
Message-ID: <a64c94294e9135ba977dc445a34b2a67@gmx.de>
X-Sender: edward.rogowski@gmx.de
User-Agent: Roundcube Webmail/1.3.0 
Sender: helena.pociechina@uwm.edu.pl
X-Authenticated-As: helena.pociechina@uwm.edu.pl
X-FEAS-SPF: sender-alignment=not-aligned, header from=edward.rogowski@gmx.de, spf-result=pass, ip=213.73.22.212, helo=moskit.uwm.edu.pl, mailFrom=helena.pociechina@uwm.edu.pl
Authentication-Results: mail-mgmt.man.olsztyn.pl;
        spf=pass (olsztyn.pl: domain of helena.pociechina@uwm.edu.pl designates 213.73.22.212 as permitted sender) smtp.mailfrom=helena.pociechina@uwm.edu.pl
        dmarc=fail header.from=gmx.de
X-FE-Policy-ID: 16:4:1:uwm.edu.pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=uwm.edu.pl; s=wariant1; c=relaxed/relaxed;
 h=mime-version:content-type:date:from:to:subject:reply-to:message-id;
 bh=yJ5S8cWnXT4nZ1W4ZxuixK59wZLY4InRooS1EsfYRuc=;
 b=Ohmkzh/c/6BF15dSqICHSYHjyoFJ0Cemo+zUN1Lj2OSXTSBbfY3XXn3sagVeWJj8AV6lu/QR6mRj
        OhWCLYlihVqjel5DcL5lWCSUVO2tu4T71fOmhxNu7dimsAsYYpKKNRLS6btMUudvtkwyXW+wwte9
        La/qioSnWnrgsS3Bypg=
X-Spam-Status: Yes, score=6.6 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_REPLYTO,LOTS_OF_MONEY,
        SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.8560]
        *  1.0 HK_RANDOM_REPLYTO Reply-To username looks random
        *  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
        *      mail domains are different
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [edward.rogowski[at]gmx.de]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
        *      EnvelopeFrom freemail headers are different
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.4 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



-- 
Schönen Tag,

Ich schreibe, um zu bestätigen, ob Sie meine vorherige E-Mail bezüglich 
der zwei Millionen Dollar erhalten haben, die Ihnen von Manuel Franco 
gespendet wurden, der am 23. April 2019 den Powerball-Jackpot in Höhe 
von 768 Millionen Dollar gewann. Bitte überprüfen Sie Ihren Posteingang 
oder Spam-Ordner und melden Sie sich bei uns für das weitere Verfahren.

Namen: Manuel Franco
