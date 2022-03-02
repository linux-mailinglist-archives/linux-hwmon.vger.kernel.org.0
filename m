Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0AB64CAA07
	for <lists+linux-hwmon@lfdr.de>; Wed,  2 Mar 2022 17:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236608AbiCBQWO (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 2 Mar 2022 11:22:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233708AbiCBQWM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Mar 2022 11:22:12 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A47F71CB8
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Mar 2022 08:21:28 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id i11so3737069lfu.3
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Mar 2022 08:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=LCcX4dK76YtLT8QNHK2nlC3Scwvt4bQ77WrFDaULisp4OrRkligjKiTbKUTXpFKG4f
         k+cooLruk1f5HP6hhEfg0K7w27TcOx6FSfwMdzkeivrlxga9j6cZM7WvkIEja8uAXz+a
         c4XQVFHe7mUwKcvFkAljHgoP8UI33y3aKniuTHEjyl4CkJ6xgPq2UlQsGjtzJJFisks2
         sURRQAP1gmTfstDQ+RTheHp3gw7MSmUtQNfauOT+cqFIPO0EnFo3q4b2o4mrjN7ZvbM2
         ID4RrH9lu/tBMjH5BnziixChQJJQB60YMEE7kfv+q+L0eVL4yLm+WlZt/HGl/PF527pk
         5E/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=juuNACCF4564vURi3Ay6EvKZT+EyU/Wb31y4+vvrIG3/lGrEQNo3VNMsmfOrzU4aTS
         vQKJXd7Ud9rTMaYIGsuzz2XekwbO7UtLJQsZcLf4QM2iHmoufOsNEfZHmtwqg2yFs57c
         Of07SCmhFiQI/O7ngPsqwhx0E7TBRvQa83vVUAmIE2AHjrIA5wOc+viLBmIv1YRh9Ufw
         y6q+Sw8TXhUOPu1uio0gWI4Kow1yp0MLumfEsb3kfgtzwGFZO2Y5Ax+xM782HmMJNlfx
         frXL4Q3cmheB/B76RJCnJnozQQh8RffqH6tl4OVh8wbjbV6fduaUi4cj+n/y7vbZJzOK
         nEHA==
X-Gm-Message-State: AOAM5317aai18CFKiWYC0dur2olBgEqaD/n/rj+wxtSCBKxyvXUAuob+
        H6wxcCZD9G+KQRyAcbMyj6Du2J808splD8eE2ME=
X-Google-Smtp-Source: ABdhPJwnOvvjGioakokxybAAGxzQ9tqgEjiVKkoIi2QrEDzCjDhfL+Qvn6jBI2p6mdDhAWotTDEe18Y/9bnYP+SPZJs=
X-Received: by 2002:a19:ee17:0:b0:443:5d4b:a4e4 with SMTP id
 g23-20020a19ee17000000b004435d4ba4e4mr19200380lfb.352.1646238084208; Wed, 02
 Mar 2022 08:21:24 -0800 (PST)
MIME-Version: 1.0
Sender: silasokwudiridavid@gmail.com
Received: by 2002:ac2:5e24:0:0:0:0:0 with HTTP; Wed, 2 Mar 2022 08:21:23 -0800 (PST)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Wed, 2 Mar 2022 17:21:23 +0100
X-Google-Sender-Auth: UpDOpkUad93DZQRkF3eBFYMEk14
Message-ID: <CA+PaGgSNUUGF+0qN7y0bP=d4wWehfMDbNh3QOOqpkOa9ZBrACQ@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        MILLION_HUNDRED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
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
