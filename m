Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85A9A4D3E6F
	for <lists+linux-hwmon@lfdr.de>; Thu, 10 Mar 2022 01:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238660AbiCJAue (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 9 Mar 2022 19:50:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234466AbiCJAue (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Mar 2022 19:50:34 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3B16E56B
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Mar 2022 16:49:34 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id b15so892414edn.4
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Mar 2022 16:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=4SL1/qbkTptdsuZGoXAM80S4DBJva1Vt53CdfbCl4nw=;
        b=qpSLYlZlxJ2Ofu3+FdX0ZemvE0K5Ab3JrQrOxBBs0Lm2G6sATTyCucT/7B66CsrpBn
         5rfStNP9PPi18T0+0syhReny+1CkZdUKFU++2mTBFK1htH4WZPA/p+18USyA0CKDIB9D
         lxa20jfMhWuxqftBK3qaYV3ANjBAKv03VaT/fbuxqjMwXpnJ5khsbMRQxUqO/TzhWo/F
         Ws4spS2R6ich2Odnl1Ezh2kOtT7SZHRJdGSTZt4ZwharkE3Dny40y4e5hvsYZi3Rp0hQ
         W60JYihoYiv9v2NN4H64w9HKVB2fPnlmQk38RKwGs5YRNOo1oZLj4aQSJdlHWQ/hesdJ
         SeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=4SL1/qbkTptdsuZGoXAM80S4DBJva1Vt53CdfbCl4nw=;
        b=Gj9hmoyFzlrfA0AMlqbCuK3hFLpEyF2lYnyBja/AhAB9AtErilT6UtGmoY0eS4D3p5
         rfjUzHT4+UgvJgkvDiKI1GgWrKGMX4b/5CPPe8mCkU8Rv6STE/u9iAj7+PYN7Vh6RjbP
         8Bz9ViFNgWO3/ppi6faHWeGdpM5U/oM9Kce1y1O5odao0g4mzEQlVmsSceWOYVzSIhdY
         sC1CdvVx1RE7iXUG4NVlaMOML3jd2Uprq8U804IzyxfmH067xL87O73wu28qewDkvENd
         xU+afcm0AqdQRArnmrVAuxkDyv60selJOS07XbheOluzbgjRps0tSLld5WiDRnQvTOE/
         PW7w==
X-Gm-Message-State: AOAM533/E4fmQJnuzpReWOIutYBPlkgWrDKO/N21Mj3V3NM7yIz1HeIl
        bHUS4n5FeJlAfBaBpBem8Nr4ivTNPQC5KO4KEvc=
X-Google-Smtp-Source: ABdhPJxco8vs9j35aitH3PgKqcccLLaqVYgVjXt8oDK9vMU37e/6a1K96CYaWbSCA41LOJopvyNeo13S97fHSbB2V5Q=
X-Received: by 2002:a05:6402:4414:b0:408:4dc0:3ee9 with SMTP id
 y20-20020a056402441400b004084dc03ee9mr1906044eda.203.1646873372960; Wed, 09
 Mar 2022 16:49:32 -0800 (PST)
MIME-Version: 1.0
Sender: julianterry39@gmail.com
Received: by 2002:a54:2346:0:0:0:0:0 with HTTP; Wed, 9 Mar 2022 16:49:32 -0800 (PST)
From:   "Mrs. Latifa Rassim Mohamad" <rassimlatifa400@gmail.com>
Date:   Wed, 9 Mar 2022 16:49:32 -0800
X-Google-Sender-Auth: qwTrMVMl6dbc4eoK41LkVsoZ7VY
Message-ID: <CA+Kqa7ci6Bo_6GXkQKFrf-Q5_bjeuYODdLb2rpW+wozbD=OSeg@mail.gmail.com>
Subject: Hello my beloved.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.6 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_NAME_FM_MR_MRS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Greetings dears,

Hello my dear Good evening from here this evening, how are you doing
today? My name is Mrs.  Latifa Rassim Mohamad from Saudi Arabia, I
have something very important and serious i will like to discuss with
you privately, so i hope this is your private email?

Mrs. Latifa Rassim Mohamad.
