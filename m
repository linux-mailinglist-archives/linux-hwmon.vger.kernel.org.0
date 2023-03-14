Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1D46B9000
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Mar 2023 11:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjCNK3k (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 14 Mar 2023 06:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbjCNK3Q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Mar 2023 06:29:16 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD3995450
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Mar 2023 03:28:20 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id p6so16123501plf.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Mar 2023 03:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678789607;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pCRen9DqHQ+J8zRujbu6FYM96j0+QTpC9KoO6YDy/Rs=;
        b=ldhSft7egbJgxKd4y9z2spnfFTii8RB81BuPL2x6k2AAQaCXj29ecxYYjAlr6hJHEK
         0TWRz++TECPqJFJA+VcsT9XJxNTvBsIwncT4YjiSGl2zH9PwWZbyKPn6f9yqABBHnHsq
         lUZyneh90gDKCi4UssD53uQVk85aHmpRemeaYLiw0B1UNjpeIesXU5RuJQYa/oiv3r6g
         STKVBch+EHd2IUES2xBCYIYcHjlPXjkWt9wykgSQ7iPbl7pgOBm9ene6SQsgCydqddO4
         eDJrUdZOvLyOASDGlTS5qPswb3RadXXRNu8unYJedmjcN0Y8Xc+E4IJpAfunjQBCT3B0
         c8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678789607;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCRen9DqHQ+J8zRujbu6FYM96j0+QTpC9KoO6YDy/Rs=;
        b=77nUE68C+b4J1xyh43f3d05QVj3tKSLVLIowT81Gsyw1DV+r8v4zD3hZbpZIIL3/XU
         boFvAJDQlnsmT6Jt7CuJ2QcxP1mJp7OPMwnvzSQlrE1tByyIg4I2KkzW1PolUmKpcMLF
         RG3aD6Ai0Y2/ZX1B+AagNqAImyW0FAwHm5YwzxvgAjxRzztIJhOpg0vqZ3O0e3ky2fpj
         HZcyC9Mjxdx52gg3iZ2BcN05ziThn7u6L8JSjiDxr9vQx7FHX2IKvuikL6QdK+EMDYSG
         pS4uDRybMulnec7hrd6rv0oKJi6i/Mu6ZVlzvmnY4WpTljauiVcRdc5vT8M+0GHYUYq9
         35vw==
X-Gm-Message-State: AO0yUKXumhwoTN1qPQsLIHkgFDm7YS87+wmWjUaKZuJU4PmgWpvf6Ds+
        vajyXixbYmjW9z0yaO8oTuGHX77kcknxdKzZz3k=
X-Google-Smtp-Source: AK7set8rk95zs2QAhNTVdrrJHun16hYFod0KlUlND46bObmXsgCaMQVvdy8vscyc7N2gHWTgwZKzlkZCsDlCn/V/FIA=
X-Received: by 2002:a17:902:fb4e:b0:19f:3682:4c60 with SMTP id
 lf14-20020a170902fb4e00b0019f36824c60mr3565669plb.2.1678789607236; Tue, 14
 Mar 2023 03:26:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac4:a797:0:b0:5d0:5a1:2179 with HTTP; Tue, 14 Mar 2023
 03:26:46 -0700 (PDT)
Reply-To: tony_william2004@yahoo.com
From:   Tony William <rev.lema1@gmail.com>
Date:   Tue, 14 Mar 2023 10:26:46 +0000
Message-ID: <CADhqz9XzMOXKyCfneqTuvv8B5Ces8UB_+37mjBd7RNGhXQ33XQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.2 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:62c listed in]
        [list.dnswl.org]
        *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.8602]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [rev.lema1[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [rev.lema1[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [tony_william2004[at]yahoo.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Gr=C3=BC=C3=9Fe
Beantworten Sie bitte respektvoll Ihre E-Mail. Bitte teilen Sie mir
weitere Einzelheiten zu dieser sehr wichtigen und dringenden
Angelegenheit mit. Ich warte so schnell wie m=C3=B6glich auf Ihre Antwort.
Vielen Dank mit freundlichen Gr=C3=BC=C3=9Fen
Herr Toni William.
