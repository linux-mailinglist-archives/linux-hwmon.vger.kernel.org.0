Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7152E524E93
	for <lists+linux-hwmon@lfdr.de>; Thu, 12 May 2022 15:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354590AbiELNqo (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 12 May 2022 09:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354583AbiELNqn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 May 2022 09:46:43 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3EC963536
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 06:46:42 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id i24so4839403pfa.7
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 06:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=BKTUsOZXurokKw93pDZ/qCH4rd2yh1Ne8HUq4b8wchY=;
        b=Y63gqBsfRrjW5Wg1/uqYlapV4UJPKvEAySHVc1O+o5rdfyAvM2PuHfdMQRqcBanwpn
         GXeS95qUUCdS+zKdlYnkVwLfRXrNXrXS0qrhDiLkgm/sp7IKbnGI2USzMB2Ls7vBHCmC
         XUlthZehM9dELVvDP9rF96SFUOF2U+o7gNgWiZd4kxez6dnpQ/sM+zFxMMzxjKjeVHDN
         waZCI68CDWH8Jh8uwR9BzqLoDAjfy7Ll6lr9RCL332yQnTNgAmrHR0XtTVKhln5eoq3T
         zm+80JagvdpuIPhyyFyCsIPVCTJlt/OBYi2SRZJZAJhSV3olCTtlQBzLHwcdrv+bYNKw
         mTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=BKTUsOZXurokKw93pDZ/qCH4rd2yh1Ne8HUq4b8wchY=;
        b=bM83OFfB1MWjVfIpDLTFFW3JbJmvWapevnM7QDiQ9YSKM6+jlujeX6m1ZBhCKCpa17
         O6RYdD5cxmc3ZZjDkFuxUdYi1E+BxHNiS22ELo2HvEyHVFlJGVJ2EaDsNiJwb8Pkg++z
         njQC283HVuYvQ6MyEQ7pmx4mDvZHLoaShA5rhFojq4P/F7VV7kZdt828tSaVJZrnpbSp
         1+DfuBrJTpiVvJHEkZrJ+3CVpM1teQxUT/ka9zt5NIo/rs2g0aIA20GsQT9gdEYWAe07
         P2S45rYnNVI07659p0oh4RBL6EMPqTcmuJQ5t/oWKg5sPcIKTMeGopgAtIii0P4GA2xS
         O0nw==
X-Gm-Message-State: AOAM530j+OiaO8yvHZBPWjJfBiyxRHlRtvgJft671xlYzoN2Ufeut9W9
        d1j9S4SHntHh6y4vJNOiHN6lx7kG0rndVUZ3PS0=
X-Google-Smtp-Source: ABdhPJxA/liaQk8S8plDAjUxUg979oUjC+zu1NUmIntTt9lxaJpdTWjcqji/aFlbusbg3ZA8ub+Y5JQEYTxokdOoGHc=
X-Received: by 2002:a05:6a00:a1e:b0:50d:bb0c:2e27 with SMTP id
 p30-20020a056a000a1e00b0050dbb0c2e27mr30166684pfh.49.1652363202221; Thu, 12
 May 2022 06:46:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:3e0c:b0:7f:499d:4df6 with HTTP; Thu, 12 May 2022
 06:46:41 -0700 (PDT)
Reply-To: musadosseh1@gmail.com
From:   David Randal <barr.musabame9@gmail.com>
Date:   Thu, 12 May 2022 15:46:41 +0200
Message-ID: <CACXnS-6WgcbSi9DpVems9L8U0N04T5VN9meEYuUV-6UU+TcQ+g@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:434 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [barr.musabame9[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [barr.musabame9[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [musadosseh1[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

My name is DAVID Randal from africa construction equipment operator I
want you to work with me as an overseas partner to do business GOLD.
If you are interested answer me.

Ms.David
