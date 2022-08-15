Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE63C592A0D
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Aug 2022 09:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbiHOHEW (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 15 Aug 2022 03:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbiHOHEV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Aug 2022 03:04:21 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F801C130
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Aug 2022 00:04:19 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id o123so6424564vsc.3
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Aug 2022 00:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=29acQNA8Cumm02CGyUpVCLdeAEc2jQcZ1RkMPZNG+yw=;
        b=Qw2Wv6bFYs1f8UYCQY7a9USoky52+coKWm6+MDP8T2+vwN8pmrvMK+ZWEfFBgVj7Ff
         s1suGNIl5pA1g9SIGkrizdNkY6vI3fN0IsK0zuhcifY7uNSlkm0nAEe8qYPWLu+/LxUd
         +YDLOuZ6ljW/cVdLgczWv5VMTuppzVovb1jm6pJInLvB427LFJCf2X7z+Jma0R8bAwOA
         TQxoKOoVVBDD1m1b2LIHdieVys6iWNBF/2y75/bifnS5qifXSv6b8CsiSoxdrau84bmN
         pM3NcnIPuGi6Tb3oufuyiU9dUqAEZVIG6SPlsv8INj2dUfHGWB0JJgXnlFfTDpVcMGQG
         KT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=29acQNA8Cumm02CGyUpVCLdeAEc2jQcZ1RkMPZNG+yw=;
        b=2M+rxEiu/klRFJc3A8xkk5XEJ53KBptztRAJc12+O+KG9egtKlxwAVPjZ1Z7hih4y2
         9Rc7u0galyVncms1XU5L15klg3BieoFVQbi0bH+cgUjA+Qjvz/ZzRBsH2iS08PHRSh4X
         2DIr4SU9wB0QTGNWnQw4WtiDsvvnLHqNNuK5pMNEcPSGUsxIkRA82ajdv8avCPquYWvD
         U9eKsXOLA96BLOadtCzRb0NIVRib7ozIziR0u6FLtdBKg2mjtHLRqQKfQ42pGZPriIoa
         EDZ7U4V5+GNeUKkXsLlakFk0rRLurZ5DM3V1ldlQ6NadBImm0ely+n+ZUu4U8X6wHbKd
         R4Ow==
X-Gm-Message-State: ACgBeo0hNvdZmtiYXhOynoDt39XdTTFnUzpMi6J2+UaauAdXxNOZZCR7
        ZukHzc6MFiGEu2EJWQqVdJFc5mCVKB5oo+Euz+I=
X-Google-Smtp-Source: AA6agR6ei86bw3REBpYHcx6QYhsSnZaD5/CdMO42BcXNtBuo1n2RuKIbmLBKC/ObhdLtqQQCGVEiHzmgGAD9hXP1hQM=
X-Received: by 2002:a67:c215:0:b0:387:21f6:282a with SMTP id
 i21-20020a67c215000000b0038721f6282amr5912515vsj.30.1660547058678; Mon, 15
 Aug 2022 00:04:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:612c:191:b0:2e3:20e1:d04 with HTTP; Mon, 15 Aug 2022
 00:04:17 -0700 (PDT)
Reply-To: avamedicinemed1@gmail.com
From:   Dr Ava Smith <brightotabor3@gmail.com>
Date:   Mon, 15 Aug 2022 00:04:17 -0700
Message-ID: <CADy_4JRjf-VVVs4ipM3dOD_uaJjWxx-5_0Xs6_DzqPyJahtLWA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e29 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5003]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [brightotabor3[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [brightotabor3[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [avamedicinemed1[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  1.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Reply me through my official email (avamedicinemed1@gmail.com)
Thanks
Ava
