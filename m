Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37D486DC558
	for <lists+linux-hwmon@lfdr.de>; Mon, 10 Apr 2023 11:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbjDJJuE (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 10 Apr 2023 05:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjDJJt4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Apr 2023 05:49:56 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F98A1711
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Apr 2023 02:49:55 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-54ee0b73e08so92778517b3.0
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Apr 2023 02:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681120194; x=1683712194;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWIONkUKCX2JMCosfarTeLGkNWabBO6R8R+bGsxbMRQ=;
        b=RpUyosrOhhL0wZpx0h55J1Kik864LAMd7bldb+7jzAs0QxLpSaP+na0qnhocaSrYoh
         H2XkdBwYkVuay7o2ydjB9mv2VhEvi1G80G+RCw7UY7uDl56fHZudaI3xNtxGx1QZLHff
         JM7ywUbW+svS5R5illHglMeeQyTQG7xPEBAJv2IbF46ebhVFFcSIGkWH9W8wfPRdoG+Q
         bATKzdi4RK6kES2fycfsN+q5XfYJSJaXtzU3NKAlKqdFi3+zOFkdkSpwtiskIdAekcFO
         JEJ53JSEqjlmXZjzboI3YErYoR2Yn4OMctIJownq9BlgU+pJIG4Ib7doDHYUNRVH3Eox
         2Wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681120194; x=1683712194;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zWIONkUKCX2JMCosfarTeLGkNWabBO6R8R+bGsxbMRQ=;
        b=Wkw11VcrIxNf42B6ppDRYhq4SH+PZn+Y9NNsmx6NXQ27Eg9i5bi1geyfTZ+dZAkuOS
         y41XH37lOA8MwDaVvbKP2L4feGDeJS1DlsdNXOIOvvdVfcmVYJ9r7Za7K6Mn6PtqfwBq
         Nkbxv1KfTgMca0BZfdfiQIsxGCV8wNM9hNK9MZ6LW2/2eiCWtgIVULGlZJAl/ka9jhde
         rKk2eulClAO65nU2hoZ6iGvCc2WhM8zD5wSTvGpgua66xZnf8x0rMVdOgafG+HXalKNo
         pJHrN5eFKYIC7agKdap3Mplmg90sZ0liXFPp0tVXVCw/LxItj9jMTGQ4+tTincrmJHNP
         0qtQ==
X-Gm-Message-State: AAQBX9dS9NwPKyckcJG4TCpm1nGHxkycDxIMm6nrR9SScKMwZ/76UL2j
        NFl7wFkq3SUNWmYqWaCCWLBvzu5ALkzm4vEuD1Q=
X-Google-Smtp-Source: AKy350addpWjKvmKKBtX77oSHTNYJAOdWDs3i/GVMNGa8jPwwWxm16ndUxRIy2roUEhHgAp1PnNRmsgJdwN4L6eizpU=
X-Received: by 2002:a81:b654:0:b0:54c:88d:4052 with SMTP id
 h20-20020a81b654000000b0054c088d4052mr3697018ywk.1.1681120194172; Mon, 10 Apr
 2023 02:49:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:4ec3:b0:49a:2de4:d8ab with HTTP; Mon, 10 Apr 2023
 02:49:53 -0700 (PDT)
Reply-To: wormer.amos@aol.com
From:   Wormer Amos <jyotsnafarhadmurad123@gmail.com>
Date:   Mon, 10 Apr 2023 09:49:53 +0000
Message-ID: <CAJzJiXWYn=eZHUKBx9=NNMLw2gz58vp3_M+0ju8rKqbpW51d_w@mail.gmail.com>
Subject: I WANT TO KNOW YOU BETTER
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Kindly want to know if you're ready for investment project in your country. i
need serious investment partnership with good background, kindly reply
me to discuss details immediately. i will appreciate you to contact me
on this email address Thanks and awaiting your quick response,

Your friend
Wormer,
