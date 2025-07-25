Return-Path: <linux-hwmon+bounces-8888-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E18B11916
	for <lists+linux-hwmon@lfdr.de>; Fri, 25 Jul 2025 09:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17D001C81439
	for <lists+linux-hwmon@lfdr.de>; Fri, 25 Jul 2025 07:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8120E2BD023;
	Fri, 25 Jul 2025 07:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKyHRw+U"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E27714A4DB;
	Fri, 25 Jul 2025 07:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753428094; cv=none; b=r6gUUsyJUdw17ecff2d6MdT/j+WuoEKam+seG/nxYdU8Myxhe5Q+Ef1DaQ/mofYxSFSUMVAUFK+W/NoG4toADULEaR+/HYebXGT++QX+rRBLn5mgQZPeMtL5LXdk7Ga5UtodypxRzaCkXzC2/MWSbItIdTi12bYJVO8zmVTXRl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753428094; c=relaxed/simple;
	bh=MFcWnB2s0eZn6s0J9k0sudcUO6GNqWWeBrHyCLv2cR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pt3NJOGMoLGQA6l9aof29M5PyrimcWIPk6XbhaA1OCWwPCSQJgwoQwVm/CskTuNxxx9a82qG+8qB3VD9Hxu5So1CM25kzXK6DSE5wPKhjKq7hId6OMxlETsqb/fpYLlwJa38KC4OmBkRGtn8vX1RENSr9+oPyBxffy9PSMdx6SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKyHRw+U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22621C4CEE7;
	Fri, 25 Jul 2025 07:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753428093;
	bh=MFcWnB2s0eZn6s0J9k0sudcUO6GNqWWeBrHyCLv2cR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bKyHRw+UlkxcGJhnkLH1pUl8ujD4meuxWaydRedFB+4c6UG5RJdGx8oGU/4Co77tk
	 g5/Q0KiMl18BlS2+MGpRpZ2X87y9POM0HZAnp3BEYD7g9Tvhpi6YystzM900hlHhQP
	 7XHFo+x9Ar75cBbq0LmXMcKeqw8xhwnVRPk4p7xOJwMrRl/mOWH6IEQ0cenDx3JVT6
	 iF9dcqFvqt2DPpNX47cA2/uGw540Etguub4dMWcvzpc2hftFIH71E/1g1kjh6xHlD+
	 w3UbpNO7qyNyeYGKg/rvHl3aF5U6UgdHMIwK85/L43PfhEZ7WWySnHFCOytfxl4zXv
	 JSC8K6IzmUb/w==
Date: Fri, 25 Jul 2025 09:21:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: hwmon: Add MPS
 mp2869,mp29608,mp29612 and mp29816 series
Message-ID: <20250725-glistening-hamster-of-perspective-1dd0dc@kuoka>
References: <20250724091011.550761-1-wenswang@yeah.net>
 <20250724091306.551131-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250724091306.551131-1-wenswang@yeah.net>

On Thu, Jul 24, 2025 at 05:13:03PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mp2869/mp2869a,mp29608/mp29608a,mp29612/mp29612a and
> mp29816/mp29816a/mp29816b/mp29816c controller
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>
> ---
> V3 -> V4:
>     1. split patches for MP2869,mp29608,mp29612,mp29816,mp29502
>     2. add description for vender specific registers
> 
> V2 -> V3:
>     merge patches for MP2869,mp29608,mp29612,mp29816,mp29502

No one asked you to merge drivers. Look where comments appear.

So again: merge the bindings, it's a churn to add one trivial device
after another.

Best regards,
Krzysztof


