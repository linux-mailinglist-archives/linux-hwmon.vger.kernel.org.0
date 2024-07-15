Return-Path: <linux-hwmon+bounces-3099-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7589313F7
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jul 2024 14:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46553B23FEA
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jul 2024 12:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C97C18A958;
	Mon, 15 Jul 2024 12:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YK25P6Dw"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699E21465B8;
	Mon, 15 Jul 2024 12:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721045864; cv=none; b=YSnU3hhJaA26zzHE7209xa3s4IvA5cZ1hYFfbwecNJNFnPIczs0N1JwAyUbM/SjrHkMtR8DzEaaw08E3xD1dRpl0ml6zrd26978lgF9C6NptkvOOcIQbTQrs7AAVQ2B0blbcw8wjLlWoSNFJDVyjiyqGKF3zEFTPwio2mmSMKkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721045864; c=relaxed/simple;
	bh=uCJLkcwDXyYOQxbRIMSEE+HcgfmMo2augGT7JD3amXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hue0QjM/66DsU23OGuDw91PDEBrwWhqPHm/nHN2FY8OF1kMfSd50q0nuyn45gVR0S79Y5q+ZjVc7iVBY4CzhGS2WKhstUh5BquZN+FD/vr71XmXoZ9aLX+vOueG7KhjF7yjcYQbDpvqqnC+XoTv00Po8OJbceOjVJDkhBQGUbL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YK25P6Dw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5E4C32782;
	Mon, 15 Jul 2024 12:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721045863;
	bh=uCJLkcwDXyYOQxbRIMSEE+HcgfmMo2augGT7JD3amXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YK25P6DwQ38slp4Xm5FuFT9bxBatFQVlAPCI+40+ivQ+GocnyGfz9fUkmHVcQzGre
	 de0KiGh5aZp4hEkSqgZh1m5AepsnXGvNlGni3pdK5ygCVXK3jmud2WBCPb6gtb3Tdk
	 vyTI1VI7NLeiECHZy4nKKUGBd3Gu2SA2bAwtG5xHfRr/7hrpNfSRCPHDiXVIBl9UpK
	 bNb0z6HaGbIDVPsyyXS2EDoefB1ES8v7aTYYuoMHx5mkkVZWvvi2yW0SescCmtHj40
	 0JsS7IW4lIc2nFRXyn5+6EO3SydTaXVCIqvuhRoqox3tXcIBnIdr5SSEibcxE8aTWC
	 b6yvjya+TJOOw==
Date: Mon, 15 Jul 2024 06:17:42 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, linux@roeck-us.net,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	krzk+dt@kernel.org, ukleinek@kernel.org, devicetree@vger.kernel.org,
	jdelvare@suse.com
Subject: Re: [PATCH v5 1/3] dt-bindings: hwmon: Add adt7475 fan/pwm properties
Message-ID: <172104586129.3775717.7588578554384809361.robh@kernel.org>
References: <20240711234614.3104839-1-chris.packham@alliedtelesis.co.nz>
 <20240711234614.3104839-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711234614.3104839-2-chris.packham@alliedtelesis.co.nz>


On Fri, 12 Jul 2024 11:46:12 +1200, Chris Packham wrote:
> Add fan child nodes that allow describing the connections for the
> ADT7475 to the fans it controls. This also allows setting some
> initial values for the pwm duty cycle and frequency.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v5:
>     - Use nanoseconds for PWM frequency and duty cycle as per existing
>       conventions for PWMs
>     - Set flags to 0 in example to match adi,pwm-active-state setting
>     Changes in v4:
>     - 0 is not a valid frequency value
>     Changes in v3:
>     - Use the pwm provider/consumer bindings
>     Changes in v2:
>     - Document 0 as a valid value (leaves hardware as-is)
> 
>  .../devicetree/bindings/hwmon/adt7475.yaml    | 35 ++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


