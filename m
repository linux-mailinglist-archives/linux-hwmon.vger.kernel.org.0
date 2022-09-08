Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 163435B1BFD
	for <lists+linux-hwmon@lfdr.de>; Thu,  8 Sep 2022 13:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiIHL5D (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 8 Sep 2022 07:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiIHL5C (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Sep 2022 07:57:02 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E059211C7D8
        for <linux-hwmon@vger.kernel.org>; Thu,  8 Sep 2022 04:57:00 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-12ab0eaa366so4241348fac.13
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Sep 2022 04:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=VyztGqq56X64nWw5lZnuh1OpkjFS+r9l4NXK1ydinT4=;
        b=ZMORj3aqF68Q32wUE/sjKbWrilkxgpHRJWw7g44s0ST4aSZYeZsVcAm3S7o8G8EeDI
         7wjtNOzU27VfuKZYGbZV7zgOp70RhMKTcn02U2v8Wu63kA8gaMi8wqFSM1GmHv9O20LE
         ijfuQw3DyTD/VbuLSuLothPhkyTOmQMfPrYlw+Bl7xdgapHKK1foWtQN+LW3KSN0sMqK
         gJC1w6VRUekCA/4OI9bOPn0AkV7rvx3Kkde4GsBKULjVysGcc+9/nCTmMZNK5PV5yOlA
         TPry3OCBEj9mfi3j8ypig0AF6WBlknaE6U6AEcNM+I222GigQ3qNzzOdFJ3unbciMVCl
         dgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=VyztGqq56X64nWw5lZnuh1OpkjFS+r9l4NXK1ydinT4=;
        b=WmtA3k1Bz2Ey0NkVeh7vpqJ4BNnxnleW8X3cDUp8W/6OwbhFiwcntXUvZ7pJPLTorB
         QuXZZS4us9Hr2aXDqX6vCMX9R5nkqEycShaJYZ0Syq+jMTRQF0XpRAIy9fRNrK66d9Xj
         8eP1qgI9+CxmfZLB8HRmBfHWlyTyvbUexyh1U4X3jrdfFw5DgyUpDBK3O2B4sVPB+LmN
         zXy5ohpMDunRxSbC9fPpB0INw9LMNnU4BaWxW/Rt4rJq/YAsFkHo1CrADUbX/Oxo70sL
         0AE6ss3gZx98CAw7q50DYSnmxIDrlWYpfiVUdgpCyBtB3c16t4k4E+e9Id2xJuIRFmXG
         s9qQ==
X-Gm-Message-State: ACgBeo1zmqKfVdZOEHUNXwTvpyrwOhipPfOsbvTyWpQFnLbxEbqW6Rmo
        Z40S0AvQGdGthzzYTTHwPGofD5Up0B6/ACgMXV0=
X-Google-Smtp-Source: AA6agR65o8n5zM1+DZsrIdWcrRWVCmmGYwBI0y3y1TYCQ2tePhwtyuXJHzAY/cxGf8lruJhdc1RThScQiED3zFzfJwc=
X-Received: by 2002:a05:6808:1b2a:b0:345:5f:ec66 with SMTP id
 bx42-20020a0568081b2a00b00345005fec66mr1317179oib.299.1662638220288; Thu, 08
 Sep 2022 04:57:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6839:4596:0:0:0:0 with HTTP; Thu, 8 Sep 2022 04:56:59
 -0700 (PDT)
Reply-To: cynthiamatanga80000000@gmail.com
From:   cynthia matanga <cynthiamatanga1001@gmail.com>
Date:   Thu, 8 Sep 2022 11:57:00 +0000
Message-ID: <CAKOS3vz0hncTAOH17ziUW+o2qrmY3wJ4LsrHg4uvRZMJfZbkiQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [cynthiamatanga80000000[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [cynthiamatanga1001[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [cynthiamatanga1001[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:34 listed in]
        [list.dnswl.org]
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Friend.
I am Cynthia Matanga.
My Father was Former  accountant general  Before He Died From Covid-19 in 2020
Before His Death my father Deposited $4.500.000.00 in Escrow account.
I have decided to invest the money in your Country.
If you interested to work with me reply back for more Details
Cynthia Matanga
