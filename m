Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBFE6EB8DD
	for <lists+linux-hwmon@lfdr.de>; Sat, 22 Apr 2023 13:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjDVLpI (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 22 Apr 2023 07:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjDVLpH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Apr 2023 07:45:07 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289CC1FC8
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Apr 2023 04:45:05 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2a8c51ba511so23824921fa.1
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Apr 2023 04:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682163903; x=1684755903;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6e2fI4p1pI3so2b6bQ/X7YEL5cKkaSbVraLHj6ERLpk=;
        b=WzEvC7/CEX3B/T0wmhrOsTiWnIfVEghCdmNDNnm7Wg1vhGzHHNtlRZtyjrIgbR04ko
         g/QkaPCxtB30Yj2vdh5u/mK/ZdOrELAELF7HjYkM2V1L3u3AOoY0F59JKyI6FJ+c4HbY
         ZndV+W5eRikTL55oeTC3BRSSg88UTdRqiBdfIjpBdHkWvLhEci34C6/uZiHzLgaJ53F+
         /3ntn0yUnPGNUsy1JGcvqSlZdeXVDxgaQ+/d4/nd8NSq+VCnCIijK23LBrWNMJcIYC3F
         uwdcEiSVB2g8EdD4yDEPvwb+NVxCbKDcb5vRp9hOLaF/a3T72/jEuA4ryVoYyUuUdExK
         P2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682163903; x=1684755903;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6e2fI4p1pI3so2b6bQ/X7YEL5cKkaSbVraLHj6ERLpk=;
        b=GYV7sDf/5XAnG5I5MTUYkXAwxt1d5V9liR2fFf6dEy2gQcK5H1Lb4d3eX1IK+1BMGQ
         rhI3MfjNOYbXIlcJyOEr4HzjNnEfzcNqNrUJVa03pnQFPk43aXI4boQaw/I47jWVCiq3
         upo8Ad56a+2kMvF3JYVQndxyC/pt4tXYAJEPq7rqobaPx3HMKTzX5lIO419OHjjzq2fy
         VEhyb+anmdriSpJR+u29qfTZZvcvHsASgILAfaIG4c0yUa/h8Xqw+QKbiBrqMktqKzNd
         70g0rEfl39RWWF21ApbzRE+aqucldVvTfJk6pYdEVWNWDSMdbFbI0cHbH/iwz6bQtNRA
         yn3g==
X-Gm-Message-State: AAQBX9djK0p3DOvL8vRjCYFUFfX7JRD6q3id9vc1enXPtKrYZCJellPB
        h12GmXpSx2iOKUyofH6zaZJ+vhSXY71tE7YqfR4=
X-Google-Smtp-Source: AKy350b2rj+PCyu8w3vSrLAKEARlM5xoF2QKqVM480od5ukukEqfD1wajkite2xsEuEJ43Kmj6XEfH/e4vKe2FKprwA=
X-Received: by 2002:a2e:9b93:0:b0:2a8:a5b8:1856 with SMTP id
 z19-20020a2e9b93000000b002a8a5b81856mr1300580lji.10.1682163903323; Sat, 22
 Apr 2023 04:45:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6520:3431:b0:25b:7e95:d4d1 with HTTP; Sat, 22 Apr 2023
 04:45:02 -0700 (PDT)
Reply-To: wormer.amos@aol.com
From:   wormer Amos <rolsbaraye@gmail.com>
Date:   Sat, 22 Apr 2023 11:45:02 +0000
Message-ID: <CAGkCXQjpWVcbWOCM4isjTRT4xUy1ZZAW+O7+EgMC5AkwwmcFaQ@mail.gmail.com>
Subject: Good Request
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

My good friend. i kindly want to know if you're capable for investment
project in
your country. i
need a serious partnership with good background, kindly reply
me to discuss details immediately. i will appreciate you to contact me
on this email address Thanks and awaiting your quick response,

Wormer,
