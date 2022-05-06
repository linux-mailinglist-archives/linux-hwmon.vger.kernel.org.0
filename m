Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75FFA51DD75
	for <lists+linux-hwmon@lfdr.de>; Fri,  6 May 2022 18:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354089AbiEFQWb (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 6 May 2022 12:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350965AbiEFQW3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 6 May 2022 12:22:29 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5A11CB11
        for <linux-hwmon@vger.kernel.org>; Fri,  6 May 2022 09:18:46 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id b19so10676658wrh.11
        for <linux-hwmon@vger.kernel.org>; Fri, 06 May 2022 09:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=UPOPB/1Kk6V7pDFdWC3DIYUIp36o3oxPCUUejAGfmZ7LP08eTQDG+lpaIUmJxpd/ug
         g9PRU94ZFQRHLtW3xNBgd1BqJqbtcQ7qXoYQ0g4CH1sU65cTlt2oeIjLW3cAs3B8bVpY
         HgzROG/ImUduhSoFXZkPKRX6hzkX7Cl01HUZeeWO32L8u7Z81vbfdMpACinKz//8K3+j
         BXvzVrWt6Jy8B93piYjBOjlJ/0Gq5EmGWlnTpihtxqrgN+Dw2srk5B7ZgwovoFbYYlaD
         YENTqsAKxSKYlkcoh4s8o9ct5InS15Ftf0BXugztGwVEOU9+VQh+iM11tLzYAtmpMzEo
         3AWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=IVHvw+g9C4gTC0ec2/zz+iQ1/K/HqBdxbqmHmvGJ8YzewO2Q+q8KblHj9LYfskhHqi
         SO9RTvVloH/+L1JtDIY0BN2YrWcL8RQ3V+8vghtUaL16HtfbFqG6FN9NRs9EFHukD4jM
         vRnjmFnk9qgMPOIdNk4s4VKfM9CQ+AXsk7LE6YJ++6EXkCBhAqR6RQdyYKWSSF2/nJC8
         q7E6C8w/SnSkyDDZyTC87IxijYD+JxdqgVzEwEZqI1cULzBV3eXj+vH1RX7yx6lw5F6B
         LB769kYyXvSW8vKummRwJSQnQRPpl5j7yxVU0N9F5ydv8DQgYBQq1Q8hfyNDAu27vKUv
         W7Cg==
X-Gm-Message-State: AOAM530R0MAJn11qkq2CRBoUaBPA1ppZVeKT4uy+ERWnudSqG1qoOc5i
        /k/FSoUDWi9ukn2JTgoHrrsDh22WMUEoX9Ou+q0=
X-Google-Smtp-Source: ABdhPJxLnJ05RMUN2i51B1kKbDh9KIvcRN3LmSyJ6gfESX2iibgM2bKcNZEaIqFUi4RTKuvBg9mjrKLMM/+iDQStaG0=
X-Received: by 2002:a5d:47a6:0:b0:20c:5f07:2c5 with SMTP id
 6-20020a5d47a6000000b0020c5f0702c5mr3373354wrb.397.1651853924955; Fri, 06 May
 2022 09:18:44 -0700 (PDT)
MIME-Version: 1.0
Sender: adesmurs02@gmail.com
Received: by 2002:a05:600c:20c9:0:0:0:0 with HTTP; Fri, 6 May 2022 09:18:44
 -0700 (PDT)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Fri, 6 May 2022 18:18:44 +0200
X-Google-Sender-Auth: Xl-zPfGRzXTwWEXgSkJysSTFV-4
Message-ID: <CAEaqy6CCTY6sgp27w8K0ncUh0bf5wk6PJR_SEqyHY==wAJCYaQ@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.0 required=5.0 tests=BAYES_95,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_NAME_FM_MR_MRS,LOTS_OF_MONEY,MILLION_HUNDRED,
        MILLION_USD,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        SUBJ_ATTENTION,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:444 listed in]
        [list.dnswl.org]
        *  3.0 BAYES_95 BODY: Bayes spam probability is 95 to 99%
        *      [score: 0.9743]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [adesmurs02[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [adesmurs02[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 MILLION_USD BODY: Talks about millions of dollars
        *  0.9 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.5 SUBJ_ATTENTION ATTENTION in Subject
        *  2.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
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

This transaction is risk-free; please urgently confirm your
willingness and interest to assist in this deal, I am in good faith
and with trust waiting for your Urgent respond and maximum cooperation
for more details.

Best Regards,
Mrs Aminata Zongo.
