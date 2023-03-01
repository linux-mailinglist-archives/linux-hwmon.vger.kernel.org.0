Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1F1A6A702C
	for <lists+linux-hwmon@lfdr.de>; Wed,  1 Mar 2023 16:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjCAPtE (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 1 Mar 2023 10:49:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjCAPtC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Mar 2023 10:49:02 -0500
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06DA1FC1
        for <linux-hwmon@vger.kernel.org>; Wed,  1 Mar 2023 07:48:47 -0800 (PST)
Received: by mail-oo1-xc42.google.com with SMTP id bd3-20020a4aee03000000b00517affa07c0so2155705oob.7
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Mar 2023 07:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SMt7axMQbQeEE0CBN+7cLsm38pqjF8+UDAWISk+ju1w=;
        b=kbILY7FOcSCRw014eicJWhDcKczXBsfCWZEYNm0lKk5uOZmV4M5r9Rnys5drhBNRWj
         jB3K5MKOWrQhZcPqgo2Ozr9K9kUGEcjPd8pMclFayOFMtcDGMMbn8kLT6/DtIk6Ydpw1
         aREaJeRNG1crXiLpuPfwWjcLL3TfRCTX5FPVtqYWgFE7lPtBhDI8NYEc0/a+K19y65xL
         wIWH8oG77eNSrTSKW9FnNrvl8dbo8mOHeEjK44PPvnsyaZTpxIcIGbULxl5spfpwxTxt
         8aIFUC1zJnBatHRmSh7T+KHCtp7PNxN4apt2x08yWpnRQj55EkpROaWGNEa7hADEmqY+
         Br5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMt7axMQbQeEE0CBN+7cLsm38pqjF8+UDAWISk+ju1w=;
        b=shntktLYeN0qzkUUmoY9VsDYaniDR/5N7R6JgJ0q1Ot22cWWy5/gMCW2+ZWSMRR/1H
         nCu84JTaiIL1X7B6/fanipO7PhZi35Hl1toU2Fq8LFvfpIbIIb4Lcu78y/UfkbeBQjZ+
         jlrtfZdyfiK9wHsM+egk8vJMy9cG0GSk7KBfIVmiMVkZzHI3E6/865IGjrM4bCRTfWfK
         ckTtnnUJewpbSGNo9Q1aECHL/KC7ELzrLdPlzt35H2N1pPSmWm0e+ekvMlHazprLW/d8
         fs2vQi5tGLJNaI21ma3jJVWO48hbQN5N2jF77xD4NsNQlouLJwZYzooyHq1KwKu68Hv+
         1ukA==
X-Gm-Message-State: AO0yUKU4EUu8fQ7f73qY85wN+BnKCVYwRdVkds/9EIUiwRZZQKoDw4L6
        5p7DCNiU9cUTZKDR34c1zKBRrKuxtFvBzJEnqHs=
X-Google-Smtp-Source: AK7set9MFdovyisKX+94YqSaZcvV1s25I6kpZ8vTpXhKLpxW57RetF7DFLYFjkVsS4HCjxG/aMjoJOWk0KVItMfgnlA=
X-Received: by 2002:a4a:984a:0:b0:51a:ac8f:b6f9 with SMTP id
 z10-20020a4a984a000000b0051aac8fb6f9mr2303393ooi.1.1677685727224; Wed, 01 Mar
 2023 07:48:47 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6870:630e:b0:176:31fe:b7eb with HTTP; Wed, 1 Mar 2023
 07:48:46 -0800 (PST)
Reply-To: sackrobert@yandex.com
From:   Robert Sack <issaj4559@gmail.com>
Date:   Wed, 1 Mar 2023 16:48:46 +0100
Message-ID: <CAF=beNu=D7UxXbGES9Qq59P_Afdi0T1LyZPQn2ewocgdQGECPw@mail.gmail.com>
Subject: INVESTMENT
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:c42 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5429]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [issaj4559[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [issaj4559[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  3.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dear Partner,

My Name is Mr.Robert Sack from  the United Kingdom.
It is my resolve to contact you for an investment proposal.
I have a client who owns a pool of funds worth Eight Million,Five
Hundred Thousand British Pounds(=C2=A38.5m)
and wants to invest in any viable and profitable business that has
good returns on investment(ROI)
such as Manufacturing, Agriculture, Real Estate,
Hoteling,Education,trading and others, in an effort to expand his
business empire globally.

If you choose to partner with my client,please indicate.

Thank you in anticipation as I look forward to reading your reply.

Mr. Robert Sack
International Financial Consultant
