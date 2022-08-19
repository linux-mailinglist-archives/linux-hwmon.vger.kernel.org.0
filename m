Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E33655993DD
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Aug 2022 06:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345909AbiHSEGN (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 19 Aug 2022 00:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343527AbiHSEGK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Aug 2022 00:06:10 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921F8D4193
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Aug 2022 21:06:09 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id h67so2430141vsc.11
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Aug 2022 21:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=irSCaQeed5QTpT38uZetOCDOAruSfVQgyH5lP37ZgN0=;
        b=l4Sj7ax6n1kP3vl4pJp1kb2v6+gO0DcMGT/gJlXMjgm2pz8u7GL1+ZcKhDZrDFOB1k
         1g55Wmuuqc9cfN5XIabRd5lU7lpmL4kmzhCloZDjajUp2wz8EjRbVIoGpFiuhD8XNqFL
         az1r2mb0W6lj+oHw7PPLYhF/V08gi7LbqGdqeqhIXJEBbt5DHFJrnzdrn0k7r0sYcThE
         GLS3YVeWzYp4JXURs95m6fNx5B64EORK4gJO+seewKHfxG9bqcFmupvw7+vM8bfy7njx
         ywIrQZduym0u2PBU+8a2BfEsIQni8EgmyDGcMdUBWjz/q4QVrx8K6FNMCwRSx7B3IgrE
         JG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=irSCaQeed5QTpT38uZetOCDOAruSfVQgyH5lP37ZgN0=;
        b=ktqajRmHWWpgZZxiRb5HcaAyvSqc0vPJ3iZyJBopi7mJQDBdLAIStwmMmF72WRToH7
         fl2LjiKX7RcVkTFRo55lsnPU2SKjwo/Tfol9+oJVFzb85CTG/cXRcjS9TmEZbYfAkTqK
         E+8CdkA4ujx/5onZpAFr4CI1KfHG4v9GObUOILLb4uwbxUlBdn/xOlgKV962yrKl0bv6
         82YCsGpHhzW9kmoiB/CP2H4T4gnXjyMIRXfS4/wKpgm3oZyqR+mh6IpGR3toJw5Prymb
         OEcfWrQSDiAErQxCVLTRHXWclrffKhcEqG4d3ogRShx5cF5cLSp9zU3as8z4VqPoLDmQ
         khHA==
X-Gm-Message-State: ACgBeo15HD3vMcEzekR4UfbPLjtcaHkbe1Xolo2UdbIVMFpylpEYOE7r
        npRFTPG5X3YEZK7UbASvGUDQszadkahRdUnDgVw=
X-Google-Smtp-Source: AA6agR4z3j5DSreCVhmpk37B5TKxEa9toYYgBrEIeTrEXtWUvJ2C6JN9WP7/rqF/h6BIaNs1buCs5JcVAvAhMxTHVGA=
X-Received: by 2002:a67:ed51:0:b0:38d:34b9:98b9 with SMTP id
 m17-20020a67ed51000000b0038d34b998b9mr2325395vsp.68.1660881968518; Thu, 18
 Aug 2022 21:06:08 -0700 (PDT)
MIME-Version: 1.0
From:   Mrs Belinda Johnson <Blndjhn6@gmail.com>
Date:   Fri, 19 Aug 2022 04:05:38 +0000
Message-ID: <CAGhZvwPrCkFvLpophUo50Lysyeq2YU32UT4JYLh1HHv=-hNZFw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

pls contact me now
