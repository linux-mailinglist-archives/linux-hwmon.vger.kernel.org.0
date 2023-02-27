Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE8B6A3F8E
	for <lists+linux-hwmon@lfdr.de>; Mon, 27 Feb 2023 11:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjB0Ki4 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 27 Feb 2023 05:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjB0Kiz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Feb 2023 05:38:55 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 692DD4C10
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Feb 2023 02:38:53 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id f13so10216749vsg.6
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Feb 2023 02:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+CEZRZEOJVmAfb07UohKPHalX/8xKQCW3mCwVUhKXY=;
        b=bNTJPjWkJur6MXe/fpMiMtfkHfmjsP3iqkK+6Pe3xytG+IAThMqK7BokqQOww4LomL
         YJ6ELtvlzoeFdsTsoQo+lTrnGK8Atk1HlGIdsUnWafcoQfVdu0Jgpx2URYQOApolg+y+
         KHTtjPxuvz2h7EtNFTx5qHi+OLTjLqLgVbCQaibuADNCkzndv0HvZAhIosT37A4NFC2x
         VsK4ReebPIYsgsTX5hQzMOOf9/j2BqmZ1vsgNW/eAo5j2T0946tqw81NSWjMNmOm7WFe
         etTRqa0qaoRGatga54pWg8YpfWVU62il5mPoH4PFMZ4h9H3HSlSbOpqxnmrMC58YlUxZ
         xGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+CEZRZEOJVmAfb07UohKPHalX/8xKQCW3mCwVUhKXY=;
        b=zKl74O8t+vH1XOnTtuf8XWRcOWYG6LyoLqDlLCrdlZ/7ET7e84O8q3pNkw3bSTUg+P
         R81smgKrMMXjqrfC16CIjDAxhgTxOHAuwVvHMUZCPHUsUFNSiZHxWhK5IX82q3Z0qaSV
         z+O2Ksiy8YutKGr1A6oPL8I4885emGMGfk9FMlXbA5U3HSBrmyX24991uf+aSyaavT4W
         k3znu7A/KqAlt6qwp+6KpSdSZLV6yANdjhBwv1pkDUPvvLWQiBuE/MQ9zLL9Cy+ggJmV
         Tim7uE0r6uFKp/r01vwExc14+jkPx3Rw6OoqTI1qVXHmsGW+FH1MK00V5TIgd1EYsvvJ
         joOA==
X-Gm-Message-State: AO0yUKXZlv+N7nmYrfpWU0cgAZ+LB06jvuiJ8KHwFZOoFo26R0PB8o4J
        p3yBcv6BGrc7dm6cMmoqOZTfH6VKT6YSoYMJ2nI=
X-Google-Smtp-Source: AK7set9YXqNyW+8b1bCVmKGxVVIw2r7zm+TREHo7lChJO5XAP8WWaeLxnfSh+gSjAjJ/wAlZdWLlTWEDUyAjZTNDFs8=
X-Received: by 2002:a05:6102:236b:b0:412:48b2:48fe with SMTP id
 o11-20020a056102236b00b0041248b248femr7084667vsa.1.1677494332480; Mon, 27 Feb
 2023 02:38:52 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:706:0:b0:3aa:fda:e563 with HTTP; Mon, 27 Feb 2023
 02:38:52 -0800 (PST)
Reply-To: godwinrichard700@gmail.com
From:   Richard Godwin <wr9236251@gmail.com>
Date:   Mon, 27 Feb 2023 02:38:52 -0800
Message-ID: <CABx9BKBxF7DDqba1B6nsge9Puj5Sw6F1eqmrn10Jj2uyvcO=1A@mail.gmail.com>
Subject: URGENT
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e36 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5246]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [wr9236251[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [godwinrichard700[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [wr9236251[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
Hello Dear Good Day,

I hope you are doing great,

I have something important to discuss with you

if you give me a listening ear.so that I can

write you in details thank you as i wait for

your reply.

Mr Richard Godwin
