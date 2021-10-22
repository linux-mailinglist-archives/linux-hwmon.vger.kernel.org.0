Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F2A437572
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 Oct 2021 12:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232616AbhJVKdH (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 22 Oct 2021 06:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232653AbhJVKdD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 Oct 2021 06:33:03 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9334C061766
        for <linux-hwmon@vger.kernel.org>; Fri, 22 Oct 2021 03:30:45 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id l38-20020a05600c1d2600b0030d80c3667aso2060739wms.5
        for <linux-hwmon@vger.kernel.org>; Fri, 22 Oct 2021 03:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Uuv/l8Z6b7ekXd997KsXRmES+x1U5+fbUAKRi/yox+M=;
        b=vghaXR6b/FRilDnKNasUTagEwjx71xTiFLLJGlqwS1Kt4HwnLry4XUcWZzxLBj/OQz
         oUznLZuzo8Kuk40Jth9Fk5xHA5M6vfXd8YFCQyE6X7hFxtEW/R45xmoV7JYl+TyQtjXb
         QsoHtr9g/zmGOunhX2Hxg50p6SJLu5pw/V7+6ccdZzfyPGApTQCzHRTNql+OBovdNaSI
         HLAlWsh4BpZDrLK+ANYYnzZ4fsRaL6Td918BL4LNA1ktgdDDqbANnJNl7kzcXs3/8cFU
         JowKUbqV/saw43egcZUcabjSN3aeHZE0Hj9IK3IWl7IwOoIVQO3LIEZXppCP9jQvMFdP
         wgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Uuv/l8Z6b7ekXd997KsXRmES+x1U5+fbUAKRi/yox+M=;
        b=CtxOJbKOh6FpLP23r+y1Nb2jFER6CG2Ena50dsRXFcrM8teSWkgHrcFARPoytSLidF
         PEMHsvtucYdyAEXnap01KRaXt0UxJ3nu9Xj6dW7MWdNwuboqDjHUmh5SlNq4ZhPk4m9A
         enXIhPzCTmjHC9GMzuwnuPzbX/AecZ3GQpjBQ+95zSxW+K88z+bRMPrS1VQB+43tj3Xv
         466EudqqnftDxK/FjBmcuNrq2kS83U9i8dnAF2frV4TKZHVjCPp3jLyFJzPqnhSXosnZ
         83Se6/ym+DWyxux/2sBvCKeAon4IkaWLGXUiqvGxt5URPWeP0rPLiZoyd8Qo5FJx56gI
         6jRQ==
X-Gm-Message-State: AOAM532KlZSteT5DN/fbWngQNFUuMXtgaG+c57G9p+8zBiHF0h6cTkXK
        ZER27/TD4bOkDrhT6XlPQhvWpw==
X-Google-Smtp-Source: ABdhPJyaZP5rL50oKIOhioIOY3zP1DE/WpC/skYPotutgfyEwmOodaalN0ZTqeBZqtWEPtstvY2nng==
X-Received: by 2002:a05:600c:1990:: with SMTP id t16mr13516553wmq.124.1634898644446;
        Fri, 22 Oct 2021 03:30:44 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id k17sm7393699wrc.93.2021.10.22.03.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 03:30:43 -0700 (PDT)
Date:   Fri, 22 Oct 2021 11:30:42 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-imx@nxp.com, amitk@kernel.org, rui.zhang@intel.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alistair23@gmail.com, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v13 2/9] mfd: simple-mfd-i2c: Add a Kconfig name
Message-ID: <YXKS0gpBAkZL4Dpg@google.com>
References: <20211015122551.38951-1-alistair@alistair23.me>
 <20211015122551.38951-3-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211015122551.38951-3-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 15 Oct 2021, Alistair Francis wrote:

> Add a Kconfig name to the "Simple Multi-Functional Device support (I2C)"
> device so that it can be enabled via menuconfig.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  drivers/mfd/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
