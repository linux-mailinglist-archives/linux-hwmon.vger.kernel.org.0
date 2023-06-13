Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBFBA72E1C6
	for <lists+linux-hwmon@lfdr.de>; Tue, 13 Jun 2023 13:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239533AbjFMLgS (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 13 Jun 2023 07:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238329AbjFMLgR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Jun 2023 07:36:17 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA83ECA
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Jun 2023 04:36:15 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5149aafef44so7682748a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Jun 2023 04:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686656174; x=1689248174;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aWPSS4nQP7w/sP247wDxABPZtjWV1EhZ4vjjjJ6SajI=;
        b=j/4PjbbH8jBLfmuke7PdKxifdkXtpIUZDqgqYr1SLtYQ80rCLF6uRmbv4qidNbQFeu
         YHnlO01+DLGzLl74nZGp42gRflO4pnQ+7WXgdeMmiUn7GKKf4dNhg5FIP624lBLEVexZ
         LmS+mbkQG8ntTOlU3yovDZmJkJF9Mr0ecK+glMYETSqKX77h6AteGmWj2fWIrtimV6YY
         EHRO1iQmNwwbpxM33+x5uYu/atdOYHIGg7DQQX0Qsffe31Z8ZQ+ekKkFUyprxY/JEICo
         4MuT0WoJTuZ3sHXNhCIHJeIonXzwN0OAdSZPCLDaCQtM7NNUsZ/bcz0DMaSQ/vQ7v2nh
         0ZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686656174; x=1689248174;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWPSS4nQP7w/sP247wDxABPZtjWV1EhZ4vjjjJ6SajI=;
        b=bfT6oP3QX7UJbIoIhfbeDlOIW3hL9o3Ke+/z7VO+nhWQj5fJAFjopqQHlrJA+aufAj
         2HsGKHxtynrdDARmtMEC0LNBMwWofHo+pRC/+gKFZ7MY18bxtnwubn/vSwzXrkCPaTQK
         xZabO9YiemOGolJGCe9WEXB+tBx7SR7b+fZFWV6waC/23+zBCFIIWdGawRcMrJA3vMLg
         4AdrpwUgnS7mMTNwTqWRwBdUeff6n0M7Jr/P1xHFA9g5Hq2DWoWuhO1IcqV9FMV9oKiI
         PhO7VQJgymq/uXRQjxmzubHC+pkxvGlSyetx6MIoAerb/lq+nBFpVh9MUVY9/DbbLYp6
         5XbQ==
X-Gm-Message-State: AC+VfDzyEoPIPGNLxPFl3rlv28FnibrxFEWjCF9XuTvb9tguBoJ2doIN
        +P4Y+UpjxjMHzqBzB8pD9YwiLorre4EMQzTjaA==
X-Google-Smtp-Source: ACHHUZ4FMP+J2aagmRuajsdLPRZ9sT22V6b+bHvwLFY0yMXMae6Pxb8y+PMLMRoDhRgQzFV8hBOIuL1pJH0obHNCNC4=
X-Received: by 2002:a17:906:fe43:b0:978:9235:d428 with SMTP id
 wz3-20020a170906fe4300b009789235d428mr11024662ejb.36.1686656174207; Tue, 13
 Jun 2023 04:36:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:c084:b0:50:6ff5:d22c with HTTP; Tue, 13 Jun 2023
 04:36:13 -0700 (PDT)
Reply-To: francescogaetano01@outlook.com
From:   FRANCESCO GAETANO <reginakarugo1968@gmail.com>
Date:   Tue, 13 Jun 2023 14:36:13 +0300
Message-ID: <CA+cNoAjKqsGoAW35VEhOJB9xH59UEbvgeQT2wx9rWVAS9C9oGg@mail.gmail.com>
Subject: Rahaline annetus.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

--=20
Summa 1 000 000,00 =E2=82=AC annetas teile Francesco Gaetano Caltagirone.
Lisateabe saamiseks p=C3=B6=C3=B6rduge palun tagasi aadressil
francescogaetano01@outlook.com



The sum of =E2=82=AC1,000,000.00 has been donated to you by Francesco Gaeta=
no
Caltagirone, Kindly get back for more info via
francescogaetano01@outlook.com
