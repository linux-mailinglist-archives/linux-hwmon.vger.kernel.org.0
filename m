Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 907036DC56D
	for <lists+linux-hwmon@lfdr.de>; Mon, 10 Apr 2023 11:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjDJJ5l (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 10 Apr 2023 05:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjDJJ5k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Apr 2023 05:57:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33942724
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Apr 2023 02:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681120617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bIev1Ni0k8gVQrBtjaksm0sBj4Jib/zWqJaw/1JzGaY=;
        b=bICj8Q2BQyDVCIzNayD9sLqCGx8pHwirQTGyklIAByW8qmzNvQe51bsOCu8m8fz1ATkkzv
        bKhWH5tCTd67ogQjdb47xU7BICFZ1z6m2Dwo+oe9Kganu76QuDc/Ly5+DXy8w8zH9UusTE
        bVjh1E2LKoN2zhNxyZN1SkuLT4d05Dc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-Tv9_93DKMce6VJiQzm9OGw-1; Mon, 10 Apr 2023 05:56:55 -0400
X-MC-Unique: Tv9_93DKMce6VJiQzm9OGw-1
Received: by mail-wm1-f71.google.com with SMTP id n36-20020a05600c502400b003ee93fac4a9so3520603wmr.2
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Apr 2023 02:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681120614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIev1Ni0k8gVQrBtjaksm0sBj4Jib/zWqJaw/1JzGaY=;
        b=wWIVi40AXUFo/0YWF7GLmk+5wbo96unqCVYmDonc3OZs6A05NlkdegHNFbzSs4I7tB
         fJ0Bqv8zdKT5UEdAg8LzZPrwh0edhUgUXTrc+P0mKKfV5XEpOg5cS2UTCFLj6bsw19SY
         HW68efXJccomLtUoOJmEDLdOMtQs4eC5s/4jUH3tFafzHkSlUhrKdheENlmeTKPZ6l/o
         N4qlu/1YHHy/DewEsvIfAFHG1R/DRqJLm0UxV2Ag/dosB0mwlDlrBeivljMPu0YU8Jc4
         KDBFrQY5zSnlayFcY0sWefZcP2b36NL6MS2CeRu2IY85+4Uf+Sa0Gsg2w5+ugGKOwihb
         Lm2Q==
X-Gm-Message-State: AAQBX9dx/6YA6KyOo1cGMALn6KoubnFRXKk+mP5GLaw9x1LrFuFaHYh/
        nshl9cfXcXV52Ebgq0vo2oMPn6fiG2YqZv4WvrDWPF6jEGOlPQQhZ2J9zYHlZAZ+R+cSfiJAz8D
        nYsux6ENT3136meiX65rDE2XvVciu4sMECQ==
X-Received: by 2002:a05:600c:4e44:b0:3ed:de03:7f0a with SMTP id e4-20020a05600c4e4400b003edde037f0amr6709502wmq.10.1681120614486;
        Mon, 10 Apr 2023 02:56:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350aIvGgfLFCNVAdSw6k5gAj7OmN/nORKbwKTw6UxO28aEz4zeHj0RwHxbx+gO7F9M4ln+QKv6w==
X-Received: by 2002:a05:600c:4e44:b0:3ed:de03:7f0a with SMTP id e4-20020a05600c4e4400b003edde037f0amr6709497wmq.10.1681120614217;
        Mon, 10 Apr 2023 02:56:54 -0700 (PDT)
Received: from redhat.com ([2.52.31.213])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c210f00b003ee20b4b2dasm13099189wml.46.2023.04.10.02.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 02:56:53 -0700 (PDT)
Date:   Mon, 10 Apr 2023 05:56:49 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alvaro Karsz <alvaro.karsz@solid-run.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] vdpa: solidrun: constify pointers to hwmon_channel_info
Message-ID: <20230410055634-mutt-send-email-mst@kernel.org>
References: <20230407150130.79917-1-krzysztof.kozlowski@linaro.org>
 <0395eff6-694e-1a2f-de78-8cb9d7b129a7@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0395eff6-694e-1a2f-de78-8cb9d7b129a7@roeck-us.net>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Apr 07, 2023 at 04:08:30PM -0700, Guenter Roeck wrote:
> On 4/7/23 08:01, Krzysztof Kozlowski wrote:
> > Statically allocated array of pointed to hwmon_channel_info can be made
> > const for safety.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > ---
> > 
> > This depends on hwmon core patch:
> > https://lore.kernel.org/all/20230406203103.3011503-2-krzysztof.kozlowski@linaro.org/
> > 
> > Therefore I propose this should also go via hwmon tree.
> 
> I am not going to apply patches for 10+ subsystems through the hwmon tree.
> This can only result in chaos. The dependent patch is available at
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-const

Doesn't it cause build errors or warnings there?

> or wait until after the next commit window to apply this patch.
> 
> Thanks,
> Guenter
> 
> > 
> > Cc: Jean Delvare <jdelvare@suse.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: linux-hwmon@vger.kernel.org
> > ---
> >   drivers/vdpa/solidrun/snet_hwmon.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/vdpa/solidrun/snet_hwmon.c b/drivers/vdpa/solidrun/snet_hwmon.c
> > index e695e36ff753..65304354b34a 100644
> > --- a/drivers/vdpa/solidrun/snet_hwmon.c
> > +++ b/drivers/vdpa/solidrun/snet_hwmon.c
> > @@ -159,7 +159,7 @@ static const struct hwmon_ops snet_hwmon_ops = {
> >   	.read_string = snet_hwmon_read_string
> >   };
> > -static const struct hwmon_channel_info *snet_hwmon_info[] = {
> > +static const struct hwmon_channel_info * const snet_hwmon_info[] = {
> >   	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_LABEL,
> >   			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LABEL),
> >   	HWMON_CHANNEL_INFO(power, HWMON_P_INPUT | HWMON_P_LABEL),

