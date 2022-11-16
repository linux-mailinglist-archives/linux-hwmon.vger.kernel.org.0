Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1FA62BDBF
	for <lists+linux-hwmon@lfdr.de>; Wed, 16 Nov 2022 13:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239178AbiKPM1P (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 16 Nov 2022 07:27:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbiKPM0q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Nov 2022 07:26:46 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DC24E404
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Nov 2022 04:23:03 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id h186-20020a1c21c3000000b003cfe48519a6so1518436wmh.0
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Nov 2022 04:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NCcvrWSluZ6xWxoxMrbOrq+h9iD8NIFWt/ldX0zWuhg=;
        b=y5/L+vS0fpgfHuv4SUDaU3im4zKnqVUZqAewsrm2yL1im0aOMqkrOFCAeyfCFuHKFk
         i3pG4dsMgGdOYxJzSRV47RSETvRsCIcJMvuVa5Y6RgUUgGS6gi5RiE9sIpSzhLxwZxkj
         owMv+z+wewK/mGatUMqLf3Z064KooAQ/4W+xYnmJ+Y0IAyu3sCjotY9kaqY3oYeHGDzf
         pb9XrrAhk+gjDwe+KnWjk2wDITh5g+q8OQVIlxies5+Zt3Nw0xoVTXGF/pDiuCJoNzV0
         PvxBapPwuDzv6N3AyIEQA2ktOz/xzYSBKVyzmO6mD2e7dnrtF3nORH8a7YGB91Rq5n9x
         dTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCcvrWSluZ6xWxoxMrbOrq+h9iD8NIFWt/ldX0zWuhg=;
        b=Jkt8JlvAY6OrQEyQ34vIICVWMGhdC3zVsXI3nJ/TYLprvKVXXoY373f3Rm4yoedL3n
         fc1Cop8KzBMf+mt9vIbafrCH6ks8wNn/ywA+63bx3RPnM8yB5tuxtQAQ4U4rlMFCpUjv
         0d29p6Jq9sQX/iUDyr9Nd+3jpR0GHHTwDfRmD/t4FSM5f89VNcr267ME2S+9Ttmjyn1D
         yj3IZ1aGyFhm7PTlhb+ldLRtz5mg8TbytiYSpDzj8Uli1t/oruRrUsiy9uTASJRY8vEg
         cmsmYTOP2UxgPEbVczR5JlY27JssPL3JvWjxaVo9z4D12WmvI0OkjFCCD34QXihwzTL/
         OfXQ==
X-Gm-Message-State: ANoB5pk1b3opXO+H+aBKFU0hrqzBsHoiCUx/hp3R1682AoS+HRpfJQrs
        1pII5YNKy8sE50OZsljoxuKuDg==
X-Google-Smtp-Source: AA0mqf5IwVD4rl/ORoKYsGl8D8jAfmH8GhkGCPt7qRpoPNnSYVvMMs/Qz7TOI1ONBlHx5rk8KVrHcw==
X-Received: by 2002:a05:600c:354d:b0:3cf:6b14:1033 with SMTP id i13-20020a05600c354d00b003cf6b141033mr1995260wmq.103.1668601382220;
        Wed, 16 Nov 2022 04:23:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:2a03:71a6:7a9d:9c71? ([2a01:e0a:982:cbb0:2a03:71a6:7a9d:9c71])
        by smtp.gmail.com with ESMTPSA id c17-20020a5d63d1000000b002322bff5b3bsm18299131wrw.54.2022.11.16.04.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 04:23:01 -0800 (PST)
Message-ID: <1fdd6b67-c7c4-b927-8d01-485ce8ee645f@linaro.org>
Date:   Wed, 16 Nov 2022 13:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From:   "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 1/4] gpu: drm: meson: Use devm_regulator_*get_enable*()
Content-Language: en-US
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-amlogic@lists.infradead.org" 
        <linux-amlogic@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <c14058c4b7018556a78455ffef484a7ebe4d8ea2.1666357434.git.mazziesaccount@gmail.com>
 <Y1K0h4De8UsZJE7W@pendragon.ideasonboard.com>
 <00d90039-c38a-ad8a-80a1-5a654a528756@linaro.org>
 <12f645b5-2820-0618-1271-6c254425099c@fi.rohmeurope.com>
Organization: Linaro Developer Services
In-Reply-To: <12f645b5-2820-0618-1271-6c254425099c@fi.rohmeurope.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 16/11/2022 13:02, Vaittinen, Matti wrote:
> Hi dee Ho Laurent & All,
> 
> On 10/21/22 18:29, Neil Armstrong wrote:
>> Hi,
>>
>> On 21/10/2022 17:02, Laurent Pinchart wrote:
>>> Hi Matti,
>>>
>>> On Fri, Oct 21, 2022 at 04:18:01PM +0300, Matti Vaittinen wrote:
>>>> Simplify using the devm_regulator_get_enable_optional(). Also drop the
>>>> seemingly unused struct member 'hdmi_supply'.
>>>>
>>>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>>>
>>>> ---
>>>> v3 => v4:
>>>> - split meson part to own patch
>>>>
>>>> RFCv1 => v2:
>>>> - Change also sii902x to use devm_regulator_bulk_get_enable()
>>>>
>>>> Please note - this is only compile-tested due to the lack of HW. Careful
>>>> review and testing is _highly_ appreciated.
>>>> ---
>>>>    drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
>>>>    1 file changed, 3 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>>>> b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>>>> index 5cd2b2ebbbd3..7642f740272b 100644
>>>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>>>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>>>> @@ -140,7 +140,6 @@ struct meson_dw_hdmi {
>>>>        struct reset_control *hdmitx_apb;
>>>>        struct reset_control *hdmitx_ctrl;
>>>>        struct reset_control *hdmitx_phy;
>>>> -    struct regulator *hdmi_supply;
>>>>        u32 irq_stat;
>>>>        struct dw_hdmi *hdmi;
>>>>        struct drm_bridge *bridge;
>>>> @@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct
>>>> meson_dw_hdmi *meson_dw_hdmi)
>>>>    }
>>>> -static void meson_disable_regulator(void *data)
>>>> -{
>>>> -    regulator_disable(data);
>>>> -}
>>>> -
>>>>    static void meson_disable_clk(void *data)
>>>>    {
>>>>        clk_disable_unprepare(data);
>>>> @@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device
>>>> *dev, struct device *master,
>>>>        meson_dw_hdmi->data = match;
>>>>        dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>>>> -    meson_dw_hdmi->hdmi_supply = devm_regulator_get_optional(dev,
>>>> "hdmi");
>>>> -    if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
>>>> -        if (PTR_ERR(meson_dw_hdmi->hdmi_supply) == -EPROBE_DEFER)
>>>> -            return -EPROBE_DEFER;
>>>> -        meson_dw_hdmi->hdmi_supply = NULL;
>>>> -    } else {
>>>> -        ret = regulator_enable(meson_dw_hdmi->hdmi_supply);
>>>> -        if (ret)
>>>> -            return ret;
>>>> -        ret = devm_add_action_or_reset(dev, meson_disable_regulator,
>>>> -                           meson_dw_hdmi->hdmi_supply);
>>>> -        if (ret)
>>>> -            return ret;
>>>> -    }
>>>> +    ret = devm_regulator_get_enable_optional(dev, "hdmi");
>>>> +    if (ret != -ENODEV)
>>>> +        return ret;
>>>
>>> As noted in the review of the series that introduced
>>> devm_regulator_get_enable_optional(), the right thing to do is to
>>> implement runtime PM in this driver to avoid wasting power.
>>
>> While I agree, it's not really the same level of effort as this patch
>> should be functionally equivalent.
> 
> While we all agree that power savings gained by runtime PM would be
> great - I don't think we should stop minor improvements while waiting
> for that to magically happen ;)
> 
> I like the saying I first heard from Jonathan Cameron - "Don't let the
> perfect be an enemy of good".
> 
> After that being said, should I re-spin this or just drop it? (I am
> cleaning up my local git from old stuff, and these are about to vanish
> from my books).

I'm ok with you, please re-spin it.

Neil

> 
> Yours,
> 	-- Matti
> 

