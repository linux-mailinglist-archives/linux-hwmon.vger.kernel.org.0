Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B3C21E0A9
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jul 2020 21:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgGMTZG (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 13 Jul 2020 15:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgGMTZG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jul 2020 15:25:06 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7E2C061755
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2020 12:25:05 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id p6so4509085uaq.12
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2020 12:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c58fzMesBGqhrQjXqO4m6q7tGi1qVPYPv+VcB4W3u3s=;
        b=mha8nIa3wwJcYw8HGrMiBF3Mqh9BaxUUw0QNdsJNEZo+P7GFJ34sfYSZ4Dac6ldiwa
         MbcIhDmmapR421rsnWjZbGDP1c0k++FFN9c0HUlBsEHWgBwzNrxsdybHpdnaBdCrA3VN
         Km9LO2Uibj3KQZsAtzjgDwVa2VdCbGZpAyIQ235mOM8FkDFmXNXedgQn8eyXf28ckJdx
         GaUSwknl88f+t9zS8aig4kUoFZkbAhBYdIdEnwW27Tr6+IIXhpJqegHPJ8lVI+z4xrNl
         eVc70PJCzTjZv/jHzphwN6rrs6RfsjUnTmkezv1zPHj9JqCZ+J5iqyLqpIX+eD/x8FXV
         M9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c58fzMesBGqhrQjXqO4m6q7tGi1qVPYPv+VcB4W3u3s=;
        b=Xt20h6Hs4bt5C7O2zNhSovNhMcg4gjeQCWj5yxgYdYYqX//bUK1/Tdg/byeuQ3yWuf
         qBmudRsyhnF7LG1QjNwtg6uwf+5LsQwZaJ1OCwYxMaht6Oh73lzqX1YrhUrOBshrbjLU
         FdaQzAeD0SmdhFDkwrWP0Bz2N1CjdnzVYAJL/A9blCE+W7QDWHEr6rnmPEeNaYmGX2TG
         NvPIoVxdFw3g5sknnARZBE/0t7X6CcazWOGU3P/O+sEn/dwzAiV+5ilPt8LVCENJtm2m
         C+D+N3UcLDgRNCllV/6nH6+Gnki4w59Escd/af34JV/ZonvrDtS1vGX5R0kjFzYN+Xn8
         viWg==
X-Gm-Message-State: AOAM533XFtS3klkZONvEO/JoVgb4Wp3txM9Y6b6wSIDabNx7JOepUvtS
        ipG6EeYrpehMFasNeto1MwRcwhs4BxMCZkn9dNZ9Uw==
X-Google-Smtp-Source: ABdhPJwP9bGsiDAnqaDUGPoQOR9PisnIuW4faekW21ANZsw39QW2WVLI/gUVmMNoRZXnfYOFJBcTipBzs4obwQc2dR0=
X-Received: by 2002:ab0:2894:: with SMTP id s20mr831300uap.55.1594668304785;
 Mon, 13 Jul 2020 12:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200710004258.296017-1-linchuyuan@google.com>
In-Reply-To: <20200710004258.296017-1-linchuyuan@google.com>
From:   Chu Lin <linchuyuan@google.com>
Date:   Mon, 13 Jul 2020 12:24:53 -0700
Message-ID: <CAKCA56A8b+8NA8Si7g+whkYSRqr7=JLV+726nyFiDjWQ70BTgA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: hwmon: adm1272: add adm1272-adm1275-temp1-en binding
To:     Guenter Roeck <linux@roeck-us.net>, robh+dt@kernel.org
Cc:     Kais Belgaied <belgaied@google.com>,
        Jason Ling <jasonling@google.com>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zhongqi Li <zhongqil@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Adding Rob to the review list.

On Thu, Jul 9, 2020 at 5:43 PM Chu Lin <linchuyuan@google.com> wrote:
>
> Problem:
>         adm1272 and adm1278 supports temperature sampling. The
> current way of enabling it requires the user manually unbind the device
> from the driver, flip the temperature sampling control bit and then bind
> the device back to the driver. It would be nice if we can control this in a
> better way by reading the dt.
>
> Solution:
>         Introducing device tree binding adm1272-adm1278-temp1-en. If the
> flag is set, flip the temp1_en control bit on probing.
>
> Testing:
> make dt_binding_check
>
> Signed-off-by: Chu Lin <linchuyuan@google.com>
> ---
>  Documentation/devicetree/bindings/hwmon/adm1275.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt b/Documentation/devicetree/bindings/hwmon/adm1275.txt
> index 1ecd03f3da4d..4403fe30f005 100644
> --- a/Documentation/devicetree/bindings/hwmon/adm1275.txt
> +++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt
> @@ -15,6 +15,8 @@ Optional properties:
>
>  - shunt-resistor-micro-ohms
>         Shunt resistor value in micro-Ohm
> +- adm1272-adm1278-temp1-en
> +       Enable temperature sampling. This is supported on adm1272 and adm1278
>
>  Example:
>
> @@ -22,4 +24,5 @@ adm1272@10 {
>         compatible = "adi,adm1272";
>         reg = <0x10>;
>         shunt-resistor-micro-ohms = <500>;
> +       adm1272-adm1278-temp1-en;
>  };
> --
> 2.27.0.383.g050319c2ae-goog
>
