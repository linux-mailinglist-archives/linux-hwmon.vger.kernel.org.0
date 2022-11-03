Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9D276173ED
	for <lists+linux-hwmon@lfdr.de>; Thu,  3 Nov 2022 02:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbiKCB6d (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 2 Nov 2022 21:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbiKCB6c (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Nov 2022 21:58:32 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70575F69
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Nov 2022 18:58:29 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-3321c2a8d4cso3204727b3.5
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Nov 2022 18:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6gpw50arjJAJYutxnBYI251PZ1iO12jHMUjWqVshAjU=;
        b=l/lMpWK59/mxYJ0uzKcU1dwz/zghIOABVMyxZ8dBz0PvXENwxIc1caZMnVDN5ph9OL
         Eett7V1ZXGZ4tt1jmwMIkeSinZcSOGpwq31OPdu3yRYj29Cz73XCd0540pdiGY8CZQgS
         P2xRNyFOnGJQ1QzaMe+vLYPJdNauK0bVde5tTvaJZAy+VbZtJqdNHmqLelj7JNv4WW4Y
         r5qqqwu04bee2qvRcOoaJ9sVMrhBdnkrJ2d+k11qP5R6ToiMqAInQ2k9lOX33TFwTuEB
         CgSCCUlcNq5BprXVI0Ykn0oIyYUBxzZZtE9w/oY2D1i5W7h5j5dvnM0aDdzip/nQ+rFw
         2uYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6gpw50arjJAJYutxnBYI251PZ1iO12jHMUjWqVshAjU=;
        b=6EqicVks8z8PD9ia1Btruxp/7JC2VuHlinOI2yCV7OXzbjEQXLL62LPaRQR35dFVH0
         xS5MSNqXYDnnuQSGqrwjCgYhUBrf/PnYx7QwMphD5g/0Mi5NK/T3is4hxZkVHEBYda1r
         56PABVKbPd3XDnu3wz5gq1dsoML7hzHPd8Qp2sfUWh4/5ixsbmHxsLSpYOof+d/BbOyf
         Gn+p4BjGtMHrZ0UsxrCXOzjkcZ7zEEtQX8G15VKzaE4VjnqourJsKqUlndAqXEuA++KG
         AaDD3M8E/gGc7e5nyPsnYsWcMTp16LfTyYAUvnvjUzBW52XVk6qv1zdOBrccgV6balLR
         oBZQ==
X-Gm-Message-State: ACrzQf3wc/BAuiV1aMj24qmjYspQYoKiBSXaMaoGJYnHq/ahq52/Ewwl
        CqRvus4lkoHiFWcli0qmWHSuDId44npwyeggE1I=
X-Google-Smtp-Source: AMsMyM4rR7xGUPShqh2e7n+4JTDWZX+l3kUKR6tTSUNwQ31Tded+dOHWuLN63vjUIjFLm1DF5tsGJn5L1zBRlD/ZyO4=
X-Received: by 2002:a81:895:0:b0:36b:fa9a:beef with SMTP id
 143-20020a810895000000b0036bfa9abeefmr25920523ywi.310.1667440709000; Wed, 02
 Nov 2022 18:58:29 -0700 (PDT)
MIME-Version: 1.0
From:   Nogay Adygman <nogay.adyge@gmail.com>
Date:   Thu, 3 Nov 2022 04:58:19 +0300
Message-ID: <CAFUOiQbsyMMmLNkA8p_jPYVZHfnZ6feoAO1TMfcCvYA3JSNBdw@mail.gmail.com>
Subject: rasist - kandidat (+history material)
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

https://de.wikipedia.org/wiki/Alexei_Anatoljewitsch_Nawalny

(+ no work link
http://lezgi-yar.ru/news/navalnyj_razreshit_gej_parady_i_zapretit_lezginku_esli_stanet_mehrom/2013-08-24-1620)

https://flnka.ru/digest-analytics/5673-kto-podstavil-kreml.html

aborigen nogai
https://www.interfax-russia.ru/south-and-north-caucasus/news/vostochnye-rayony-stavropolya-nuzhdayutsya-v-pritoke-naseleniya-v-tom-chisle-za-schet-ukrainskih-bezhencev-senator

interes monument
http://zapravakbr.com/index.php/analitik/1498-madina-khakuasheva-chto-skryvayut-geroicheskie-pamyatniki
