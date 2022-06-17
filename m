Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68AA554FC4C
	for <lists+linux-hwmon@lfdr.de>; Fri, 17 Jun 2022 19:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbiFQRh4 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 17 Jun 2022 13:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbiFQRhz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Jun 2022 13:37:55 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E42912D37
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Jun 2022 10:37:53 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3177f4ce3e2so25428687b3.5
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Jun 2022 10:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=2NTi/QegNnVCEQq7rooYSxMGN049ehSK5P7btoT2DLE=;
        b=lToURDLs1eXda/1iT+vZlBbV0ZrU5a4no4s5885WZz1nylsau7WX4WQunnh29zTszQ
         9ghBAwizmFNv37rudggjYEssfJFjm5WddymDJfNIrXfPaNg/3awvr8uUT71Djtf/J/T6
         u57IPrNJK6ty0nl5hVoQMdrqe6RnOXfhFhJbZUhaBJcIq67illYaxp8IiePeLgTthzeU
         4Oq9N1PtvueTIv21wBJr6KAu/DxoS63Bulz06rM0649qBI6xvSrNe7AM5OAfb/IrI4K/
         nfqhe6AyhtwQmSiiWGCa8MNoD7MVcGF/NqvQSKc7UoxtYqvVu2sQpcFP7W0A9tYcgtfY
         KgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=2NTi/QegNnVCEQq7rooYSxMGN049ehSK5P7btoT2DLE=;
        b=Q1IW4Ix0XGVcqpGeM7EplVhPVfbuFS/C+LuVIyNLLn0hekIRsYuHjn6CWdQHRWIpCW
         ZRT3/Kfo+Lt26tJgeW3rNQq7RYUNVueYQBfTe3O8eFTS29Tb9SaBI6Ngh5xMo9MOyErU
         Bvs19ODDdA8nqrTzpRq9n+fV3W7CARXqYvrkXM1i08+jUkS0MoLJnXl3l9w0hfK9XHOY
         Ln37eSHVN0m/Bj88vmzKadWZsT0/MENVoQP7/mp7JqtmGVuiIu3u6rBhYBh798v824/l
         ne8MI+UMSoQODXnZ7Ch/ZimGSYb+KAkL9Z0birAbB31gLpquGv1hvYAGJobw+E7zfmfI
         5+qA==
X-Gm-Message-State: AJIora/3J3/IyT9gbfyTE9NJ4NHNJqcPY6IWvcEkjI3C2+M33Ep1iF3q
        2P3ujnXCmO64X/jpJN6XTr2AqBGHvpr2+5pR1x0=
X-Google-Smtp-Source: AGRyM1tyB7HHCxCifEfcSbSrQnA7/AUVNQ5utyMmuTWR5A3/KIucd6AACwCYTBugC5gqqVj7uJM0vqrJ1n5OHsuAfZs=
X-Received: by 2002:a81:6103:0:b0:317:5b6c:70d with SMTP id
 v3-20020a816103000000b003175b6c070dmr12287273ywb.494.1655487473078; Fri, 17
 Jun 2022 10:37:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:904a:b0:181:980a:a2fd with HTTP; Fri, 17 Jun 2022
 10:37:52 -0700 (PDT)
Reply-To: werinammawussi@gmail.com
From:   Werinam Mawussi <barkokouelom877@gmail.com>
Date:   Fri, 17 Jun 2022 19:37:52 +0200
Message-ID: <CAP7XkbCSa2si1j6Tpq6POJeirXJXhJjYYwc6foLQ0HRXc1HG4w@mail.gmail.com>
Subject: Important Notification
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:112d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [barkokouelom877[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [barkokouelom877[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

I am bringing this notice to your attention in respect of the death of
a client of mine that has the same surname with you and his fund
valued at $19.9M to be paid to you.contact me at
werinammawussi@gmail.com for more details.

Yours Sincerely,
Werinam Mawussi,
Attorney At Law.
