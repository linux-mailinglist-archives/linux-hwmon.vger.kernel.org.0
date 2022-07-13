Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37ED1573BA8
	for <lists+linux-hwmon@lfdr.de>; Wed, 13 Jul 2022 19:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbiGMRBi (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 13 Jul 2022 13:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbiGMRBh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Jul 2022 13:01:37 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3601724F0B
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Jul 2022 10:01:36 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id q14so1495812iod.3
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Jul 2022 10:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=v8Zo3SE+kG67jQ+tPmVqGCXonDsKni6ePkoyu1grjJE=;
        b=USxExtI4riV0kBzcFvb52pr0Y+oh+68CeGMFVvPHDqK96HrXBkckSkZZKa8cjDAGJu
         1jOjhrcb3pz3OFUJie4YZw56eX2CPO4/va7+NUHoWrmgd8ROFVbjezJIr4iZ4V8Zlf6E
         8geMx63rh9HrCgz8ZuIUNCQyHzi7wBGKE43DePHguxnaDrJNkZ+qXaJtRQarE6gc/DYX
         u33natQiblXkQmUrA6MsKSf4xmHxggBgwtnY+dlDsCCV3YRDsX+jxjnWy88P+ZQMnN9g
         fnpVAbzvGZ1FB01z9ENsPMpLRW75GQGH9CDsuCKe6An0YoMlxMQzVW77U8D8lFkAxUKh
         vf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=v8Zo3SE+kG67jQ+tPmVqGCXonDsKni6ePkoyu1grjJE=;
        b=mKpZdmO2b2gR2d9pqOAgPHgGxgsqpwObc+TT79AVdIFIRy+ZEe+l0oblXqyCybkz7m
         rhUR9BSiMYM4nkkf7f3juAHWQfx96M4/mC64S/kkyBZWhEOoGfdeVlYPFXXiwjcw8+6K
         X7axH8HieBE2QVi4AZOY/8rCMkLFPB0p1a5ncEq2ZVl9bOzYc6D8CCQ0qmkNaKi85D54
         shx0nfLJWzDw53neLp7iKwTyehI4dkbI1Uc1qIUyO6d33h+IqHdjfU4HsoxOykZviWTF
         DbK6nHN3gT3pN4RkG3IxhcEdB7axvpvISR3YfzkBI7Ngpf20+LBXyfzMd2/qmsukWCc7
         PXGA==
X-Gm-Message-State: AJIora/DB2sOgU6jv31r+QX+Etx8JxQgTN0YAzX6R9wIc0HRFpf+4Ac5
        Led8g0JG4rfUuaOAAWIGi7emVGqXt4Ksr+MPrPk=
X-Google-Smtp-Source: AGRyM1trIH9OCL0LLLwqkNPH5KkcOBWUadSK492ZxQnvGHiQmFSn0hfJbCnFKimEkvwX6oejAmyth1Ucn5SyrLqIIfs=
X-Received: by 2002:a05:6602:15d1:b0:678:60ee:88bc with SMTP id
 f17-20020a05660215d100b0067860ee88bcmr2198334iow.73.1657731695509; Wed, 13
 Jul 2022 10:01:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:9b0d:0:0:0:0:0 with HTTP; Wed, 13 Jul 2022 10:01:35
 -0700 (PDT)
Reply-To: te463602@gmail.com
From:   "Dr. Irene Lam" <prdr6h7j9g5@gmail.com>
Date:   Wed, 13 Jul 2022 10:01:35 -0700
Message-ID: <CAJtQnuJVLncWdRu__aaJj3VoA4ZMVBX1MTk_S1k7GTg1hSNzFA@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.0 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d31 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6349]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [prdr6h7j9g5[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [te463602[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [prdr6h7j9g5[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
I'm Prof. Dr Diane, how are you doing hope you are in good health,
the Board director try to reach you on phone several times Meanwhile,
your number was not connecting. before I was ask to send you an email
to hear from you if you are fine. hoping to hear from you soonest.

Best regards
Prof. Dr Diane,
