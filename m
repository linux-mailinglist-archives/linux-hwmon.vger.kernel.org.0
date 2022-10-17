Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85515600C35
	for <lists+linux-hwmon@lfdr.de>; Mon, 17 Oct 2022 12:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbiJQKVG (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 17 Oct 2022 06:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbiJQKUn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Oct 2022 06:20:43 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE815FDE5
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Oct 2022 03:20:39 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id s20so16722380lfi.11
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Oct 2022 03:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSKuz9BJS/Qwel4yBJUKsJP++c1z8gtIosTtEbMtN5I=;
        b=iCJaLXltXrEX9UAfKjGtIXKr1Isn50srDB/TWic8cEMyvhkfgCyV9PH6Ne49HxIEIf
         F5mlGjXs5Mx7U+iWiQXkmwzOFJ/WROAE7oYLIxEVE4dat1te5NUzIyipa2bRxk4x8j3E
         ZrBOKhgRsCI3ynqKv9bVEdu3rYnnqE6FVd8d99cqAy5ydITOS+I2c1v63aMkX0R9AJHT
         azMzEEmS86tdkr5rmFYuE8/y4j23cJTl7bDWaLbXFNXUi647d3w1mjzN88KCSF+CrUIW
         dzBYqn+WxY6rYDB/M0nO4nT8krcK9PkNyOQR8AhrtO5bo2g0vDrVw1B5qrHeCvrxfOOj
         Yh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pSKuz9BJS/Qwel4yBJUKsJP++c1z8gtIosTtEbMtN5I=;
        b=QCPdxZkUxX9+kRSO8eKKhi3MrXzeg+tUThbNhUAiktNvqM6mt/ljZ6jeBIYiuZSRdK
         EnschTIUnL+doVfMxwM9ni+7pifafSBG+VULVVy6yF8QJHsv1OHaabudS3ZAswG5FLYA
         4eBnp7mXl/vJHF9FW1pLMzxdpEw6p3CQaT0pez7ryFu4Uslvjmvwt/2bt6IG08ctzeFb
         whqJ17Wr4gAzA/i0lpCtmhydmFGBxFtBpFX8eESVeJ8dvB43OAMJq+p7b0mXQoqNN+5s
         5+jErdNw4/7OtXbq+s/t7HrYQokP4dvhH2I0BIcwydpzNv1kpEduuNAEYpQmHbjTmob9
         3cdg==
X-Gm-Message-State: ACrzQf3EkssJ5c5qO8PUM6MH0Fza0rxw0cL0PFW9wj+iIKpJ9zwo2P+t
        SNwtqfmZBRP56+/PoTKqhlAi1vbDGDFlxoWr32A=
X-Google-Smtp-Source: AMsMyM5ulLYFZgN8LPFv7wwku0NgkyA8M3y8wRXdiOtJFPWSLWaYruXomLqPq5f1ozNkAmzAaa8blUjg7xZ+cvAcv3E=
X-Received: by 2002:a05:6512:4011:b0:4a2:5148:9e48 with SMTP id
 br17-20020a056512401100b004a251489e48mr3589397lfb.337.1666002037453; Mon, 17
 Oct 2022 03:20:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa6:d9af:0:b0:227:e35:cdd9 with HTTP; Mon, 17 Oct 2022
 03:20:36 -0700 (PDT)
Reply-To: davidnelson7702626@gmail.com
From:   john mark <johncp5547@gmail.com>
Date:   Mon, 17 Oct 2022 11:20:36 +0100
Message-ID: <CAEvS9HGwei2UT9Y5655dCKOc8fb4EMD5PC0qw24=_CWKS3Gaqw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:12a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [johncp5547[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [davidnelson7702626[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [johncp5547[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello friend, I want to send money to you to enable me invest in your
country get back to me if you are interested.
