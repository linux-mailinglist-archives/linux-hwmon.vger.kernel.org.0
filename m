Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1ED510272
	for <lists+linux-hwmon@lfdr.de>; Tue, 26 Apr 2022 18:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351810AbiDZQEO (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 26 Apr 2022 12:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352775AbiDZQED (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Apr 2022 12:04:03 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E3DBB852
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Apr 2022 09:00:54 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id q22so20559705iod.2
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Apr 2022 09:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=BGH93snULo5xdwpbNRpG9IM64xjKrM5cisVCg0+vObk=;
        b=b5oZdbmJV9OnC+pXA3nhmPBUyMa6QS3dT5B5ilgHntNb+7sxvM8tjkWHodPpRBAsET
         PP6qzV74//qHWjBjmt272OWg6nmQeW4bNomaloakNUTv8pvLkinX9lZ807OVNGcioyEG
         I5bkWgYkFcjVrH3WOT/LbrwH+TX2XioDRU5hM0il8xuEgjpmPQ04yBiIo3Sn3wImg9xx
         7zsGozlmy62VZrKFt8F78CsnD7n6rB3BY1Mhaj2TFuZ/VMJqBOgNewu4eQvLQnkZ3rFC
         kGIQvMSZCwq+P3kWe8DRn4mOqW0sXcnAdaNe1R8WfP5zPUSOJKn1aIaseVQ5gGdcphjV
         qzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=BGH93snULo5xdwpbNRpG9IM64xjKrM5cisVCg0+vObk=;
        b=UGnA8hyrM4FiVJp/bCmW/U8KTiBjni5411yPXU7P9Gt0NbZQsq92f54HHhleHX9Sce
         8PRdSZvyufQTjCwUgbfLWrgerN581QNLQ+8gYTefUV+mgS2iVfFfkZsHkX+CMLVZd5oG
         yEnZ8BdMDz6n6oFKQv8HWuEAyWTM2SeAG42jRz441sSvkrPXkLdUXOoI7+aGu8T66E/n
         y+UMCOXqjlYnWGP4jMhTlD4PTeG1GjsuV2CgT6fsV6Y3nP2wEzq1xeOeQnPGf/q3pe3y
         1NbMLgcazO5jF3pVh/a5zUULv85oqu+zafTwTiLRr51RjHXP8KAiLZE7vfpP101gA2EE
         8URw==
X-Gm-Message-State: AOAM532pYteEZ04IW/DLPdyS2Xltk+za2mnYDwk4UzsxVa/nDKU15kzo
        ZnXiwTbz1dk6daO79g3yjItrGq4XpBMESlKosiCxE0wHWhA=
X-Google-Smtp-Source: ABdhPJz+f+D/qqJqKG79kALBySkdDAr7DlezwZo4UtX8VWClrNJ9sOlY/xbz/0LBoHwkHczGgwiyxVx7YC6UQxIsn8s=
X-Received: by 2002:a05:6e02:1a6b:b0:2cc:1eef:9c8c with SMTP id
 w11-20020a056e021a6b00b002cc1eef9c8cmr9899976ilv.256.1650988853764; Tue, 26
 Apr 2022 09:00:53 -0700 (PDT)
MIME-Version: 1.0
Sender: tracywilliam2oo5@gmail.com
Received: by 2002:a05:6e02:10d1:0:0:0:0 with HTTP; Tue, 26 Apr 2022 09:00:53
 -0700 (PDT)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Tue, 26 Apr 2022 18:00:53 +0200
X-Google-Sender-Auth: pA0nKGr0EXcow_pV4U-rCl4FoZg
Message-ID: <CAFfTYvaKeD8ZoG9=kdq844N4FY85eQA=EBTJ9GnRcgLM0q+QfQ@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.9 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,
        MILLION_USD,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        SUBJ_ATTENTION,T_HK_NAME_FM_MR_MRS,UNDISC_MONEY,US_DOLLARS_3
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d31 listed in]
        [list.dnswl.org]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 0.9996]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 0.9996]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tracywilliam2oo5[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [tracywilliam2oo5[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 MILLION_USD BODY: Talks about millions of dollars
        *  0.9 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  0.0 US_DOLLARS_3 BODY: Mentions millions of $ ($NN,NNN,NNN.NN)
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.5 SUBJ_ATTENTION ATTENTION in Subject
        *  2.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

ATTENTION PLEASE,

I am  Mrs Aminata Zongo, a personal Accountant/Executive board of
Directors working with United bank for African Burkina Faso (UBA). I
have an interesting business proposal for you that will be of immense
benefit to both of us. Although this may be hard for you to believe,
we stand to gain a huge amount  between us in a matter of days. Please
grant me the benefit of doubt and hear me out. I need you to signify
your interest by replying to my mail.

Honestly, i have business transaction worth the sum of
(US$8,200,000.00) Eight Million two hundred thousand united state
dollars to transfer to you through proper documentation in position of
your own Account.

Most importantly, I will need you to promise to keep whatever you
learn from me between us even if you decide not to go along with me. I
will make more details available to you on receipt of a positive
response from you.

Best Regards,
Mrs Aminata Zongo.
