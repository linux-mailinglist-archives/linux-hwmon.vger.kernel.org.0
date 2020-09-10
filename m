Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63DF9264B0A
	for <lists+linux-hwmon@lfdr.de>; Thu, 10 Sep 2020 19:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgIJRUn (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 10 Sep 2020 13:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbgIJRU2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Sep 2020 13:20:28 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF53AC061795
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2020 10:20:27 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id z22so9858218ejl.7
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2020 10:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=HJ4WCgkKVpSJwvVsPhFStCc8bgYAbRqt32AnN8mYRds=;
        b=tQcXN1GAvYhoCJVfJUxAp9ZFrHI6GU2nv68Zoqa+AvUsab3E/b8REHZJiVT2YHw90u
         bi6E5/BAHpPRaNok1/vOMMDcMutDeM+pRZeN+TmpRpd3278L6ZAsd65qWtBFL6AUAVHb
         aV7WDk2fr493Oe0B1CyOTzkL27cFLnZWDj/1zYZzqQKlYNVN3thX0Jk9gg/O4fjWtepo
         HVeM+wYeuf/astvWHsCus2wuxU1KaUy4sFcK0uZxNZJYswLnRf1IpK9OhayKSiqc9G+G
         Vxcb7rKADkCl1bHCpxz1nhfP1++fgKLftsWsMnFudTWkZgyVPB1jhqB2shcUDp8Hr1mZ
         cQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=HJ4WCgkKVpSJwvVsPhFStCc8bgYAbRqt32AnN8mYRds=;
        b=eKyZK4lh3eAJUMCRVlZREPtolM9969Z1juDcXILsneFC0dGbFMBKzRDMK/fPaL39nw
         pOEtBoLo6nvtQPpFFFXP9mKTwmaCfM/uX/A/YWFgacOk6/xssOgIjvkkQf9DRclWFPtw
         iloRds00XG4t9Qi3XlnitSRPTKqV2p7H2HMSVOj5igxK+9q+VSfh39zL8ljIGNtVknYg
         nVDLWdkQBln9RiHr8Obnl6rh6kmY1dunGN85H/pDtcJJ4NPAdhlW6Tfa58z4E7EXs/82
         u2rA/KZysFTUvmboVGWInCfJvy7JCoI4JlEQuHwX8p3yX5VrX5xQv5tFiYcOH7VqV2WN
         3Z7Q==
X-Gm-Message-State: AOAM5318/yspFXwPoZN2mybm/mVU8vAf2RihI4lBm+ksb3Sd9NOUNZ+q
        8NoqjI3zt5RDDLBs8i4IitNposKF8IrvOkfEidsCKA==
X-Google-Smtp-Source: ABdhPJyb+x7vObwo6KSEusHlPUEiXe9p2AnJQuZowHtorgy1L4c4db1C5Htxw0Ap5DN/mK2cmW9LUot6bs31yivl4ZI=
X-Received: by 2002:a17:906:7489:: with SMTP id e9mr9732119ejl.154.1599758426140;
 Thu, 10 Sep 2020 10:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200910170910.1990578-1-linchuyuan@google.com>
In-Reply-To: <20200910170910.1990578-1-linchuyuan@google.com>
From:   Chu Lin <linchuyuan@google.com>
Date:   Thu, 10 Sep 2020 10:20:15 -0700
Message-ID: <CAKCA56CVHDDk0FDuda143L=_OXQ5JyWA=joKtKq-ok+R6JSYRg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: pmbus: max20730: adjust the vout reading given
 voltage divider
To:     Chu Lin <linchuyuan@google.com>, jdelvare@suse.com,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Qiong Wang <qiongwang@google.com>,
        Zhongqi Li <zhongqil@google.com>,
        Jason Ling <jasonling@google.com>,
        Kais Belgaied <belgaied@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The same patch got sent twice. Please, discard this one.

Thanks,
Chu

On Thu, Sep 10, 2020 at 10:09 AM Chu Lin <linchuyuan@google.com> wrote:
>
> Problem:
> We use voltage dividers so that the voltage presented at the voltage
> sense pins is confusing. We might need to convert these readings to more
> meaningful readings given the voltage divider.
>
> Solution:
> Read the voltage divider resistance from dts and convert the voltage
> reading to a more meaningful reading.
>
> Testing:
> max20730 with voltage divider
>
> Signed-off-by: Chu Lin <linchuyuan@google.com>
> ---
>  drivers/hwmon/pmbus/max20730.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
> index c0bb05487e0e..4b56810fa894 100644
> --- a/drivers/hwmon/pmbus/max20730.c
> +++ b/drivers/hwmon/pmbus/max20730.c
> @@ -29,6 +29,7 @@ struct max20730_data {
>         struct pmbus_driver_info info;
>         struct mutex lock;      /* Used to protect against parallel writes */
>         u16 mfr_devset1;
> +       u32 vout_voltage_divider[2];
>  };
>
>  #define to_max20730_data(x)  container_of(x, struct max20730_data, info)
> @@ -111,6 +112,12 @@ static int max20730_read_word_data(struct i2c_client *client, int page,
>                 max_c = max_current[data->id][(data->mfr_devset1 >> 5) & 0x3];
>                 ret = val_to_direct(max_c, PSC_CURRENT_OUT, info);
>                 break;
> +       case PMBUS_READ_VOUT:
> +               ret = pmbus_read_word_data(client, page, phase, reg);
> +               if (data->vout_voltage_divider[0] && data->vout_voltage_divider[1])
> +                       ret = DIV_ROUND_CLOSEST(ret * data->vout_voltage_divider[1],
> +                                               data->vout_voltage_divider[0]);
> +               break;
>         default:
>                 ret = -ENODATA;
>                 break;
> @@ -329,6 +336,15 @@ static int max20730_probe(struct i2c_client *client,
>         data->id = chip_id;
>         mutex_init(&data->lock);
>         memcpy(&data->info, &max20730_info[chip_id], sizeof(data->info));
> +       if (of_property_read_u32_array(client->dev.of_node, "vout-voltage-divider",
> +                                      data->vout_voltage_divider,
> +                                      ARRAY_SIZE(data->vout_voltage_divider)) != 0)
> +               memset(data->vout_voltage_divider, 0, sizeof(data->vout_voltage_divider));
> +       if (data->vout_voltage_divider[1] < data->vout_voltage_divider[0]) {
> +               dev_err(dev,
> +                       "The total resistance of voltage divider is less than output resistance\n");
> +               return -ENODEV;
> +       }
>
>         ret = i2c_smbus_read_word_data(client, MAX20730_MFR_DEVSET1);
>         if (ret < 0)
> --
> 2.28.0.526.ge36021eeef-goog
>
