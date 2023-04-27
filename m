Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 691636F0796
	for <lists+linux-hwmon@lfdr.de>; Thu, 27 Apr 2023 16:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243743AbjD0OhF (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 27 Apr 2023 10:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243906AbjD0OhE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Apr 2023 10:37:04 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FBD211B
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Apr 2023 07:37:03 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-552a6357d02so102399027b3.3
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Apr 2023 07:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682606222; x=1685198222;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=EncXQsgNXqqTP5Ekpl5U92VwHsDJ4C7+tZw6asVq8X6g3Ttfv21/xm2H7Lcy31OzHN
         uaQQ8hPvN5UhHn3xnNfrh8lWP3zKoTHUBKvkGTuhLi39UOGvc9dnZOku6Bhntp+crngW
         uxE4PlOaGT6TPhYuPWZY+FoMTzGDrp3ODnBkrIiAbS1NgMyLX9r1ZJASIXb8T2+TKIGW
         hlGyKzpS8mxOSnDvBIx2sSHyp4tKH7kk0SzD/G/A08wo+e8uyZfc8nxd/PG9n63mUMt2
         Uq3CUYEM8kMF5CAyN56xcwaRU1AXwabXJg9Ct655k/FS1sWMVRb+omSY0mr6roOlBlCB
         BM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682606222; x=1685198222;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=DITzSmIGKihX5yhlBQhf2j/CujsqTFr7PXeOKai3ZFHjS8WcSq9L9tYpTahM6S18v7
         4kMtj6QkL2EKub4SfW+HdM0roQQxGL2V5RSMYHIzMnoOpwPhQN9r7TUZivOKGbhA/7z1
         6KlBcEV6SB08CSVLEsfqfaabP+T7o9H0qh53SddymLwjMAgsnHMzTGHvUXUBR+wWBGb7
         O1diQ7EoFxrxY6w7rtcYWg3sj+EoPMbfpXAYFXwhn184mu0MSZ7SpQ3y3p30MSkCNZsH
         7v1eLz+Op8CHomsR4nkqBREPMvsOQLgaRfvIU5i3S98MRlN6TXAp9wwVSSeTgWpyNZ1m
         vZfQ==
X-Gm-Message-State: AC+VfDwA7kI5WPq9Ub89uE11G1XmuJR6kpwQBSlBN/gWfIF3goQIKzfq
        xKmTisCScaplUjV2ukeT5CiWf6TvdEw+Wq2x/eM=
X-Google-Smtp-Source: ACHHUZ4P1tuPGHp/72E4vO+jigj/eB/+kNoW7L28GLytjszEvYYAc6AFeLTCVyc4j9/n6c6RFVtAI9yoby660yNQc0w=
X-Received: by 2002:a81:7584:0:b0:556:1182:958a with SMTP id
 q126-20020a817584000000b005561182958amr1216806ywc.24.1682606222417; Thu, 27
 Apr 2023 07:37:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:6701:b0:348:dc97:ae8a with HTTP; Thu, 27 Apr 2023
 07:37:01 -0700 (PDT)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <gracebanneth@gmail.com>
Date:   Thu, 27 Apr 2023 07:37:01 -0700
Message-ID: <CABo=7A3jP7zG=eFXjEaGsHagDYf53McFM3CVbRZh-viTqUrecQ@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
