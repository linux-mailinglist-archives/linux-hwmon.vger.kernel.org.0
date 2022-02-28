Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6D64C713E
	for <lists+linux-hwmon@lfdr.de>; Mon, 28 Feb 2022 17:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233910AbiB1QFm (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 28 Feb 2022 11:05:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbiB1QFm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Feb 2022 11:05:42 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75DEA41983
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Feb 2022 08:05:02 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id d3so16261660wrf.1
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Feb 2022 08:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=Zkw2yyQ7PfAVAWZuSIlA+W6EHWyoP/PWUvwLSDc/3YJNlX1Ioa+nsy8V/vykCnFBWy
         R/ZiuCxP/6t6D/vmGdBijBvj/qU00shel5E0Dkigpsj9fiSlg3eKCkqzM0M5UMDt0mkf
         QHa9aQOvhPkyZWQ+yNGnGZK04lnZjsN3Xll9uthm9jV6sb9+M6jRnIQhAbiMzmFaa/yJ
         9S/DCnA+Hmk8xGK/CwOk/ChoREitxq31qI3l6E75ah99Wg+GRDJzhE/gK5bvtpbBK+YF
         uopNhclDgg7+sZGjz1yNf8emO6XPYt+X4+n+DxdBlhIPuIvt945fm5GSzzCNVkN9QBBb
         h6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=XtI1f9sWRZ2UC78GPu4V47vwU7sGdDfWHDLuspgulf8=;
        b=QXco6Z/snEKcPO7t6B2g6+ETRW84HBlcVRi+DMRE+8BXVZKpYb+7YZm7nG4e2DfP0y
         t4f5pUIMi5ZeVxTphuVZBh9Ufg5ppnsGASXNc7xUO4xN3+1a50eYfNsd5zFP1bqpVg91
         yMJrQq0EkBgjL8KMgSreuf+LQItWhDGgUIBC8hSB8KcBjWic+JwWPpJzuqu8PEnesEWN
         cXKE8A0b+CnIIZVJSdIHozTNXBNArsW4S8ez4Z/k3EdcXFSw6m2n+YAahMm6I8YG1p50
         F7SIkFGEs71YaJI8go7Y5pScqCAhm9H8Tg3sRJCrTcmi60QniGDs7IgRxex/7BwrQiSd
         7AuA==
X-Gm-Message-State: AOAM532rIOsl6UIh9RE//HtDxAQEpEoDInfG14bkwlH+DcyNOVv63XG9
        9FEPU5deE/gRIPUC/VYZoTduLQcrgc3SfYPVX7Q=
X-Google-Smtp-Source: ABdhPJynSaszZIyrg3cBoRlqWCZ5U/vupb31Vshs2J6mQ7VgLM8zfCba/eymKLQZ0O6fa0zmb/Lp/4ZSmuF26HJljsI=
X-Received: by 2002:a05:6000:156c:b0:1e2:eb89:9a82 with SMTP id
 12-20020a056000156c00b001e2eb899a82mr15702549wrz.397.1646064300988; Mon, 28
 Feb 2022 08:05:00 -0800 (PST)
MIME-Version: 1.0
Sender: adesmurs02@gmail.com
Received: by 2002:a05:600c:3d91:0:0:0:0 with HTTP; Mon, 28 Feb 2022 08:05:00
 -0800 (PST)
From:   MRS AMINATA ZONGO <mrsaminatazongo@gmail.com>
Date:   Mon, 28 Feb 2022 17:05:00 +0100
X-Google-Sender-Auth: jibnihSQOXQuXmMD_-w64azjU6I
Message-ID: <CAEaqy6A9mfZyT_shGdzsgsjX0mgK2KXnnCV9nxm71W+5cygsFQ@mail.gmail.com>
Subject: ATTENTION PLEASE,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
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
