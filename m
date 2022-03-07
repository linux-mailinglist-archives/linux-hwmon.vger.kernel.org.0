Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF7E4D07F7
	for <lists+linux-hwmon@lfdr.de>; Mon,  7 Mar 2022 20:52:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241059AbiCGTwy (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 7 Mar 2022 14:52:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233990AbiCGTwx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Mar 2022 14:52:53 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8A88932E
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Mar 2022 11:51:58 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id t11so25071938wrm.5
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Mar 2022 11:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=inwYIvYBHBS6yUWKpspXo76snOoEX8xwNe5SFDnj/8TWE8GuDFK7/4SQPEQj+JbDn6
         N7g3w458w1mhA0AckLEaBqe2UeradMYhQYbCR+XAoXIlOcbfBuaocudG157IVPpYQMj8
         jwSGbiXNZlgbKkTYC8bxP0kyQpesN2Xu+3jE/uw0LGXnZ+ipeuIABWxnIamYWeQRTWeE
         zDaWfWuUMeFaRv5e4ezAOudwzGonT6i91SAa+1DUFCmPEcPrXUtTRwZ3zhuVBIPMqRR5
         fWXeUYlAcDVra3pXjz+XCmDGArYj3iWqd2P9ntUT/0oRTvNwGePUDbFLso9iv6kR4hIn
         SdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=eXdDwqWBk9L9suMmaY3v/Sn2N0YzPrQtSCWIvcP5/BGiDp/m3OlyZna3yqsQK64EGK
         xc33xJcX9sX/E8DawOY0od2bzCKMFN7xt4gf5L+qht7LS82oxoAzDUGycMziAF/13Nbl
         X7r8vgqj+aghcPrweCxZKoOcv/5Rudfmr7SxK/B1kYmuySGhJzuD5GZ34cFwSxIrZ2Tm
         +aj9vZ23nnGNmNTFuROhKtv5skSMo0YeHS7KpPukvtv/9FMU2L9+AA76uiG30t+9GeM6
         5W7SK5lfBZlZwow1MbO5Qaorh06SpwEoJHSZ2Ttgr5udWRAZJYHRzX2MdBeDhFdhmcPx
         rluA==
X-Gm-Message-State: AOAM533JeH3+ixVkpFIj4xim3Ug4O5tHHFGQqRFNDShqc5LcqgFxNJm0
        +EX3X817zr9WbPhD4vyLPf4n2XbBguTZOi8pMzY=
X-Google-Smtp-Source: ABdhPJzDnH+68dlXyepbic91NaMZDWpB03RZNXeVt2mpBtZuufBGcyTIeQg+jGiKwhI+UIFccRxjlSxANtquFzJg+QE=
X-Received: by 2002:adf:dc86:0:b0:1f0:250a:265 with SMTP id
 r6-20020adfdc86000000b001f0250a0265mr9520039wrj.85.1646682717001; Mon, 07 Mar
 2022 11:51:57 -0800 (PST)
MIME-Version: 1.0
Sender: adesmurs02@gmail.com
Received: by 2002:a05:600c:4ed1:0:0:0:0 with HTTP; Mon, 7 Mar 2022 11:51:56
 -0800 (PST)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Mon, 7 Mar 2022 20:51:56 +0100
X-Google-Sender-Auth: eOdCDaBQGWWESs2YRVwiCcGRroc
Message-ID: <CAEaqy6BMpWAdzQugWwSczzTCTTbzzESoubn=i1L90Fwc88KFNQ@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,SUBJ_ATTENTION,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:443 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5008]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrsaminatazongo[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [adesmurs02[at]gmail.com]
        *  0.4 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.4 SUBJ_ATTENTION ATTENTION in Subject
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.6 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
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
